class CreateFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :features do |t|
      t.string :code, null: false
      t.float :properties_mag, null: false
      t.string :properties_place, null: false
      t.datetime :properties_time, null: false
      t.string :properties_url, null: false
      t.boolean :properties_tsunami, null: false
      t.string :properties_mag_type, null: false
      t.string :properties_title, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false

      t.timestamps
    end

    # Add validations for range
    execute <<-SQL
      ALTER TABLE features
        ADD CONSTRAINT chk_mag_range CHECK (properties_mag >= -1.0 AND properties_mag <= 10.0)
    SQL

    execute <<-SQL
      ALTER TABLE features
        ADD CONSTRAINT chk_latitude_range CHECK (latitude >= -90.0 AND latitude <= 90.0)
    SQL

    execute <<-SQL
      ALTER TABLE features
        ADD CONSTRAINT chk_longitude_range CHECK (longitude >= -180.0 AND longitude <= 180.0)
    SQL
  end
end
