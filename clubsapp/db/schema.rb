# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140525055732) do

  create_table "announcements", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements_clubs", id: false, force: true do |t|
    t.integer "announcement_id"
    t.integer "club_id"
  end

  add_index "announcements_clubs", ["announcement_id", "club_id"], name: "index_announcements_clubs_on_announcement_id_and_club_id"
  add_index "announcements_clubs", ["club_id"], name: "index_announcements_clubs_on_club_id"

  create_table "clubs", force: true do |t|
    t.string   "nickname",               default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "description"
    t.string   "website"
    t.integer  "reg_no"
    t.string   "president_first_name"
    t.string   "president_last_name"
    t.string   "president_contact"
    t.string   "president_email"
    t.string   "treasurer_first_name"
    t.string   "treasurer_last_name"
    t.string   "treasurer_contact"
    t.string   "treasurer_email"
    t.string   "admin_first_name"
    t.string   "admin_last_name"
    t.string   "admin_contact"
    t.string   "admin_email"
    t.string   "email"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.boolean  "approved",               default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "event_id"
  end

  add_index "clubs", ["event_id"], name: "index_clubs_on_event_id"
  add_index "clubs", ["location_id"], name: "index_clubs_on_location_id"
  add_index "clubs", ["nickname"], name: "index_clubs_on_nickname", unique: true
  add_index "clubs", ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true

  create_table "clubs_users", id: false, force: true do |t|
    t.integer "club_id"
    t.integer "user_id"
  end

  add_index "clubs_users", ["club_id", "user_id"], name: "index_clubs_users_on_club_id_and_user_id"
  add_index "clubs_users", ["user_id"], name: "index_clubs_users_on_user_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "event_type"
    t.datetime "event_time"
    t.string   "location"
    t.string   "description"
    t.string   "image1_file_name"
    t.string   "image1_content_type"
    t.integer  "image1_file_size"
    t.datetime "image1_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
    t.integer  "ticket_id"
  end

  add_index "events", ["club_id"], name: "index_events_on_club_id"
  add_index "events", ["ticket_id"], name: "index_events_on_ticket_id"

  create_table "events_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uni_id"
    t.integer  "club_id"
  end

  add_index "locations", ["club_id"], name: "index_locations_on_club_id"
  add_index "locations", ["uni_id"], name: "index_locations_on_uni_id"

  create_table "tickets", force: true do |t|
    t.integer  "number"
    t.float    "price"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "purchase_location"
    t.string   "description"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"

  create_table "tickets_users", id: false, force: true do |t|
    t.integer "ticket_id"
    t.integer "user_id"
  end

  add_index "tickets_users", ["ticket_id", "user_id"], name: "index_tickets_users_on_ticket_id_and_user_id"
  add_index "tickets_users", ["user_id"], name: "index_tickets_users_on_user_id"

  create_table "unis", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "location_id"
  end

  add_index "unis", ["location_id"], name: "index_unis_on_location_id"
  add_index "unis", ["user_id"], name: "index_unis_on_user_id"

  create_table "users", force: true do |t|
    t.string   "nickname",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "student_id"
    t.integer  "user_type"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uni_id"
  end

  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uni_id"], name: "index_users_on_uni_id"

end
