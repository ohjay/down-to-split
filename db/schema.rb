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

ActiveRecord::Schema.define(version: 20160222185356) do

  create_table "debts", force: :cascade do |t|
    t.decimal  "owes"
    t.boolean  "closed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "related_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "purchase_id"
    t.float    "percentage"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "expenses", ["purchase_id"], name: "index_expenses_on_purchase_id"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.date     "date_purchased"
    t.decimal  "cost",             precision: 10, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "product_id"
    t.string   "category"
    t.integer  "shopping_trip_id"
    t.integer  "vendor_id"
  end

  add_index "purchases", ["shopping_trip_id"], name: "index_purchases_on_shopping_trip_id"

  create_table "shopping_trips", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.string   "payer"
    t.float    "total",      default: 0.0
  end

  add_index "shopping_trips", ["vendor_id"], name: "index_shopping_trips_on_vendor_id"

  create_table "shopping_trips_users", id: false, force: :cascade do |t|
    t.integer "shopping_trip_id"
    t.integer "user_id"
  end

  add_index "shopping_trips_users", ["shopping_trip_id"], name: "index_shopping_trips_users_on_shopping_trip_id"
  add_index "shopping_trips_users", ["user_id"], name: "index_shopping_trips_users_on_user_id"

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
    t.string   "username"
    t.decimal  "weekly_budget"
    t.integer  "shopping_trip_id"
    t.text     "debts"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "vendors", force: :cascade do |t|
    t.string   "vendor_name"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
