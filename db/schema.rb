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

ActiveRecord::Schema.define(version: 20170718104445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boostcampaings", force: :cascade do |t|
    t.integer  "job_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total_budget"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status",       default: 0, null: false
  end

  create_table "boostedjobs", force: :cascade do |t|
    t.integer  "job_id"
    t.date     "boosted_date"
    t.integer  "daily_budget"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "boosts", force: :cascade do |t|
    t.integer  "job_id"
    t.date     "boosted_date"
    t.string   "daily_budget"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "category_id"
    t.integer  "city_id"
    t.text     "address"
    t.text     "about"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "company_name"
    t.string   "company_website"
    t.integer  "job_type",        default: 0, null: false
    t.integer  "category_id"
    t.integer  "salary_range_id"
    t.integer  "city_id"
    t.text     "description"
    t.text     "requirement"
    t.text     "how_to"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "status",          default: 0, null: false
    t.datetime "boost_start"
    t.datetime "boost_end"
    t.integer  "boost_budget",    default: 0, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "salary_ranges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           default: "", null: false
    t.string   "encrypted_password",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "authentication_token"
    t.datetime "authentication_token_created_at"
    t.integer  "role_id",                         default: 2
    t.integer  "budget",                          default: 0,  null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
