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

ActiveRecord::Schema.define(version: 2023_12_03_201424) do

  create_table "enquiries", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.integer "nights"
    t.integer "guests"
    t.boolean "with_pets"
    t.string "first_name"
    t.string "last_name"
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_enquiries_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.integer "price_per_night"
    t.integer "minimum_nights"
    t.integer "cleaning_fee"
    t.integer "max_guests"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.boolean "pet_friendly"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enquiries", "properties"
end
