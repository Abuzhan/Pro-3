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

ActiveRecord::Schema.define(version: 20170124122147) do

  create_table "boxes", force: true do |t|
    t.integer  "carwash_id"
    t.boolean  "online"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_types", force: true do |t|
    t.string   "car_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
  end

  create_table "carwashes", force: true do |t|
    t.string   "name"
    t.integer  "phone_number"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "city_id"
    t.string   "contacts"
    t.boolean  "status",          default: false
  end

  add_index "carwashes", ["phone_number"], name: "index_carwashes_on_phone_number", unique: true
  add_index "carwashes", ["remember_token"], name: "index_carwashes_on_remember_token"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "carwash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_services", force: true do |t|
    t.integer  "order_id"
    t.integer  "service_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "box_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "price"
    t.integer  "status"
    t.string   "car_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "worker_id"
  end

  create_table "prices", force: true do |t|
    t.integer  "carwash_id"
    t.integer  "service_id"
    t.integer  "car_type_id"
    t.integer  "price"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
  end

  create_table "schedules", force: true do |t|
    t.integer  "carwash_id"
    t.integer  "day"
    t.time     "opening_time"
    t.time     "closing_time"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                            default: false
    t.integer  "car_type_id",          limit: 255
    t.integer  "city_id",              limit: 255
    t.integer  "phone_number"
    t.string   "authentication_token"
  end

  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workers", force: true do |t|
    t.string   "name"
    t.integer  "carwash_id"
    t.integer  "fixed_salary"
    t.integer  "percentage"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
