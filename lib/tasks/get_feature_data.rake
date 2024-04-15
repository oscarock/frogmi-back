require 'httparty'

namespace :feature do
  desc "Get earthquake data from USGS and persist in database"
  task get_data: :environment do
    url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'

    begin
      response = HTTParty.get(url)
      data = JSON.parse(response.body)

      data['features'].each do |feature|
        properties = feature['properties']
        coordinates = feature['geometry']['coordinates']

        next if Feature.exists?(code: feature['id'])

        next if properties['title'].nil? || properties['url'].nil? || properties['place'].nil? || properties['magType'].nil? || coordinates[0].nil? || coordinates[1].nil?

        next unless (properties['mag'] >= -1.0 && properties['mag'] <= 10.0) && (coordinates[1] >= -90.0 && coordinates[1] <= 90.0) && (coordinates[0] >= -180.0 && coordinates[0] <= 180.0)

        Feature.create(
          code: feature['id'],
          properties_mag: properties['mag'],
          properties_place: properties['place'],
          properties_time: Time.at(properties['time'] / 1000),
          properties_url: properties['url'],
          properties_tsunami: properties['tsunami'],
          properties_mag_type: properties['magType'],
          properties_title: properties['title'],
          longitude: coordinates[0],
          latitude: coordinates[1]
        )
      end
      puts "Datos persistidos en la BD"
    rescue HTTParty::Error, JSON::ParserError => e
      puts "Error: #{e.message}"
      return
    end
  end
end