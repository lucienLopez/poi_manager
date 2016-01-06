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

ActiveRecord::Schema.define(version: 20160106213809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "point_of_interest_tag_links", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "point_of_interest_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "point_of_interest_tag_links", ["point_of_interest_id"], name: "index_point_of_interest_tag_links_on_point_of_interest_id", using: :btree
  add_index "point_of_interest_tag_links", ["tag_id"], name: "index_point_of_interest_tag_links_on_tag_id", using: :btree

  create_table "point_of_interests", force: :cascade do |t|
    t.string   "default_name"
    t.string   "adress"
    t.decimal  "latitude",     precision: 10, scale: 6
    t.decimal  "longitude",    precision: 10, scale: 6
    t.decimal  "rating",       precision: 2,  scale: 1, default: 0.0
    t.integer  "city_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "point_of_interests", ["city_id"], name: "index_point_of_interests_on_city_id", using: :btree
  add_index "point_of_interests", ["default_name"], name: "index_point_of_interests_on_default_name", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "point_of_interest_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reviews", ["point_of_interest_id"], name: "index_reviews_on_point_of_interest_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string   "text"
    t.integer  "language_id"
    t.integer  "point_of_interest_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "translations", ["language_id", "point_of_interest_id"], name: "index_translations_on_language_id_and_point_of_interest_id", unique: true, using: :btree
  add_index "translations", ["language_id"], name: "index_translations_on_language_id", using: :btree
  add_index "translations", ["point_of_interest_id"], name: "index_translations_on_point_of_interest_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "last_name"
    t.string   "first_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "point_of_interest_tag_links", "point_of_interests"
  add_foreign_key "point_of_interest_tag_links", "tags"
  add_foreign_key "point_of_interests", "cities"
  add_foreign_key "reviews", "point_of_interests"
  add_foreign_key "reviews", "users"
  add_foreign_key "translations", "languages"
  add_foreign_key "translations", "point_of_interests"
end
