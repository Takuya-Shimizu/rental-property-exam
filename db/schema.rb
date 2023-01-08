# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_08_035016) do

  create_table "nearest_stations", force: :cascade do |t|
    t.string "line"
    t.string "station"
    t.integer "on_foot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_nearest_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.string "rent"
    t.string "address"
    t.string "the_age_of_the_building"
    t.text "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "nearest_stations", "properties"
end
