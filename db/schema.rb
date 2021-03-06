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

ActiveRecord::Schema.define(version: 20160126023807) do

  create_table "event_relationships", force: :cascade do |t|
    t.integer  "followed_event_id"
    t.integer  "follower_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "event_relationships", ["followed_event_id"], name: "index_event_relationships_on_followed_event_id"
  add_index "event_relationships", ["follower_id", "followed_event_id"], name: "follower_and_followed_event_id", unique: true
  add_index "event_relationships", ["follower_id"], name: "index_event_relationships_on_follower_id"

  create_table "events", force: :cascade do |t|
    t.string   "description"
    t.string   "day"
    t.datetime "beginning"
    t.datetime "end"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "events", ["restaurant_id"], name: "index_events_on_restaurant_id"

  create_table "restaurant_relationships", force: :cascade do |t|
    t.integer  "followed_restaurant_id"
    t.integer  "follower_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "restaurant_relationships", ["followed_restaurant_id"], name: "index_restaurant_relationships_on_followed_restaurant_id"
  add_index "restaurant_relationships", ["follower_id", "followed_restaurant_id"], name: "follower_and_followed_restaurant_id", unique: true
  add_index "restaurant_relationships", ["follower_id"], name: "index_restaurant_relationships_on_follower_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "country"
    t.string   "city"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
