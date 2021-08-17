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

ActiveRecord::Schema.define(version: 2021_07_25_134827) do

  create_table "outputs", force: :cascade do |t|
    t.string "client_name"
    t.float "sqft"
    t.string "location1"
    t.string "location2"
    t.string "location3"
    t.float "location1_min"
    t.float "location2_min"
    t.float "location3_min"
    t.float "location1_min_override"
    t.float "location2_min_override"
    t.float "location3_min_override"
    t.float "location1_max"
    t.float "location2_max"
    t.float "location3_max"
    t.float "location1_max_override"
    t.float "location2_max_override"
    t.float "location3_max_override"
    t.float "total_range_min"
    t.float "total_range_max"
    t.float "build_estimate_min"
    t.float "build_estimate_max"
    t.integer "hcl"
    t.float "total_cost_min"
    t.float "total_cost_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "price_data", force: :cascade do |t|
    t.string "location"
    t.float "average_lot"
    t.float "median_lot"
    t.float "low_lot"
    t.float "high_lot"
    t.float "pp_sqft"
    t.float "under_one_acre_SP"
    t.float "one_to_three_acre_SP"
    t.float "adjusted_low_lot"
    t.float "adjusted_high_lot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
