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

ActiveRecord::Schema.define(version: 20170411043600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "screening_id"
    t.integer  "user_id"
    t.boolean  "paid_status",  default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["screening_id"], name: "index_bookings_on_screening_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "cinemas", force: :cascade do |t|
    t.string   "cinema_name"
    t.string   "contact"
    t.string   "address"
    t.string   "state"
    t.string   "company"
    t.float    "latitude",    null: false
    t.float    "longitude",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.json     "photos"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "genre"
    t.string   "trailer_url"
    t.string   "cast"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "duration"
    t.json     "photos"
    t.date     "release_date"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.string   "braintree_payment_id"
    t.string   "status"
    t.string   "fourdigit"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["reservation_id"], name: "index_payments_on_reservation_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "reference_id"
    t.index ["reference_id"], name: "index_roles_on_reference_id", using: :btree
  end

  create_table "screenings", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "price"
    t.date     "start_date"
    t.time     "start_time"
    t.integer  "showplace_id"
    t.integer  "hall_no"
    t.index ["showplace_id"], name: "index_screenings_on_showplace_id", using: :btree
  end

  create_table "seats", force: :cascade do |t|
    t.string   "row_number"
    t.integer  "seat_number"
    t.boolean  "booking_status", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "booking_id"
    t.integer  "screening_id"
    t.index ["booking_id"], name: "index_seats_on_booking_id", using: :btree
    t.index ["screening_id"], name: "index_seats_on_screening_id", using: :btree
  end

  create_table "showplaces", force: :cascade do |t|
    t.integer  "cinema_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_showplaces_on_cinema_id", using: :btree
    t.index ["movie_id"], name: "index_showplaces_on_movie_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "phone_number"
    t.date     "birthday"
    t.integer  "gender"
    t.string   "city"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "bookings", "screenings"
  add_foreign_key "bookings", "users"
  add_foreign_key "screenings", "showplaces"
  add_foreign_key "seats", "bookings"
  add_foreign_key "seats", "screenings"
  add_foreign_key "users", "roles"
end
