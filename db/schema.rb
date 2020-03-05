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

ActiveRecord::Schema.define(version: 2020_03_04_161736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bills", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.string "service_sku"
    t.index ["booking_id"], name: "index_bills_on_booking_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.string "booking_number", null: false
    t.bigint "guest_id"
    t.bigint "hotel_id"
    t.index ["guest_id"], name: "index_bookings_on_guest_id"
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
  end

  create_table "chats", force: :cascade do |t|
    t.boolean "status"
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_chats_on_hotel_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_events_on_hotel_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "availability"
    t.string "room_number", null: false
    t.bigint "booking_id"
    t.bigint "hotel_id"
    t.index ["booking_id"], name: "index_rooms_on_booking_id"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "roomservices", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_roomservices_on_room_id"
    t.index ["service_id"], name: "index_roomservices_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "category", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_services_on_hotel_id"
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
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "name"
    t.integer "stars"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "roomservices", "rooms"
  add_foreign_key "roomservices", "services"
end
