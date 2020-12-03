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

ActiveRecord::Schema.define(version: 2020_12_03_024131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "check_in_records", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.date "date"
    t.uuid "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_check_in_records_on_room_id"
  end

  create_table "check_out_records", force: :cascade do |t|
    t.date "date"
    t.uuid "room_id"
    t.integer "customer_id"
    t.decimal "total_amount"
    t.integer "total_days"
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id", "customer_id"], name: "index_check_out_records_on_room_id_and_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.text "address"
    t.string "phone"
    t.string "email"
    t.integer "gender"
    t.integer "age"
    t.integer "status"
    t.uuid "check_in_record_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_in_record_id"], name: "index_customers_on_check_in_record_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer "room_no"
    t.integer "room_type_id"
    t.decimal "rent", precision: 10, scale: 2, default: "0.0"
    t.boolean "is_available", default: false
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["is_available"], name: "index_rooms_on_is_available"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
