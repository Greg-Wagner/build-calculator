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

ActiveRecord::Schema.define(version: 2021_09_09_175059) do

  create_table "outputs", force: :cascade do |t|
    t.string "client_name"
    t.float "sqft"
    t.string "location1"
    t.string "location2"
    t.string "location3"
    t.string "location1_min"
    t.string "location2_min"
    t.string "location3_min"
    t.string "location1_min_override"
    t.string "location2_min_override"
    t.string "location3_min_override"
    t.string "location1_max"
    t.string "location2_max"
    t.string "location3_max"
    t.string "location1_max_override"
    t.string "location2_max_override"
    t.string "location3_max_override"
    t.string "total_range_min"
    t.string "total_range_max"
    t.string "build_estimate_min"
    t.string "build_estimate_max"
    t.integer "hcl"
    t.string "total_cost_min"
    t.string "total_cost_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "price_data", force: :cascade do |t|
    t.string "location"
    t.string "adjusted_low_lot"
    t.string "adjusted_high_lot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
