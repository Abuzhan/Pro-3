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

ActiveRecord::Schema.define(version: 20170310052954) do

  create_table "boxes", force: true do |t|
    t.integer  "carwash_id"
    t.boolean  "online"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: true
  end

  add_index "car_types", ["name"], name: "index_car_types_on_name", unique: true

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
    t.boolean  "status",          default: true
  end

  add_index "carwashes", ["phone_number"], name: "index_carwashes_on_phone_number", unique: true
  add_index "carwashes", ["remember_token"], name: "index_carwashes_on_remember_token"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true

  create_table "combos", force: true do |t|
    t.string   "name"
    t.integer  "carwash_id"
    t.integer  "car_type_id"
    t.integer  "price"
    t.string   "description"
    t.boolean  "status",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "carwash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     default: true
  end

  create_table "offorders", force: true do |t|
    t.integer  "box_id"
    t.integer  "worker_id"
    t.integer  "combo_id"
    t.string   "car_number"
    t.boolean  "status"
    t.integer  "discount"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "details"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offorderservices", force: true do |t|
    t.integer  "order_id"
    t.boolean  "status",      default: true
    t.integer  "offprice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offprices", force: true do |t|
    t.integer  "carwash_id"
    t.integer  "offservice_id"
    t.integer  "car_type_id"
    t.integer  "price"
    t.string   "description"
    t.boolean  "status",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offservices", force: true do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offservices", ["name"], name: "index_offservices_on_name", unique: true

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "box_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "price_id"
    t.integer  "status"
    t.string   "car_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "worker_id"
    t.integer  "discount"
    t.string   "details"
  end

  create_table "prices", force: true do |t|
    t.integer  "carwash_id"
    t.integer  "service_id"
    t.integer  "car_type_id"
    t.integer  "price"
    t.boolean  "status",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "schedules", force: true do |t|
    t.integer  "carwash_id"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.string   "sunday"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["name"], name: "index_services_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                            default: false
    t.integer  "car_type_id",          limit: 255
    t.integer  "city_id"
    t.integer  "phone_number"
    t.string   "authentication_token"
    t.boolean  "status",                           default: true
  end

  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workers", force: true do |t|
    t.string   "name"
    t.integer  "carwash_id"
    t.integer  "fixed_salary"
    t.integer  "percentage"
    t.boolean  "status",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
