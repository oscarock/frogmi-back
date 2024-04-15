module Api
  module V1
    class FeaturesController < ApplicationController
      def index
        features = Feature.all
        features = features.where(properties_mag_type: params[:mag_type]) if params[:mag_type].present?
        features = features.paginate(page: params[:page], per_page: params[:per_page])

        serialized_features = features.map do |feature|
          {
            id: feature.id,
            type: 'feature',
            attributes: {
              external_id: feature.id,
              magnitude: feature.properties_mag,
              place: feature.properties_place,
              time: feature.properties_time.to_s,
              tsunami: feature.properties_tsunami,
              mag_type: feature.properties_mag_type,
              title: feature.properties_title,
              coordinates: {
                longitude: feature.longitude,
                latitude: feature.latitude
              }
            },
            links: {
              external_url: feature.properties_url
            }
          }
        end

        render json: {
          data: serialized_features,
          pagination: {
            current_page: features.current_page,
            total: features.total_entries,
            per_page: features.per_page
          }
        }
      end
    end
  end
end