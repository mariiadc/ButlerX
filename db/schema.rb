# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_02_172637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.string "booking_number", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.boolean "status"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price"
    t.bigint "service_id"
    t.index ["service_id"], name: "index_meals_on_service_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "availability"
    t.string "room_number", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "category", null: false
    t.integer "price", null: false
    t.bigint "user_id"
    t.bigint "room_id"
    t.index ["room_id"], name: "index_services_on_room_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "address"
    t.string "name"
    t.integer "stars"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "chats", "users"
  add_foreign_key "events", "users"
  add_foreign_key "meals", "services"
  add_foreign_key "rooms", "users"
  add_foreign_key "services", "rooms"
  add_foreign_key "services", "users"
end
