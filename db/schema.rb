# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_10_004703) do
  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "feature_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_comments_on_feature_id"
  end

  create_table "features", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "code", null: false
    t.float "properties_mag", null: false
    t.string "properties_place", null: false
    t.datetime "properties_time", null: false
    t.string "properties_url", null: false
    t.boolean "properties_tsunami", null: false
    t.string "properties_mag_type", null: false
    t.string "properties_title", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "`latitude` >= -90.0 and `latitude` <= 90.0", name: "chk_latitude_range"
    t.check_constraint "`longitude` >= -180.0 and `longitude` <= 180.0", name: "chk_longitude_range"
    t.check_constraint "`properties_mag` >= -1.0 and `properties_mag` <= 10.0", name: "chk_mag_range"
  end

  add_foreign_key "comments", "features"
end
