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

ActiveRecord::Schema.define(version: 20150429141138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pastries", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price_per_unit"
    t.datetime "confirmed_at"
    t.string   "state"
    t.string   "unit_volume"
    t.integer  "shop_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pastries", ["shop_id"], name: "index_pastries_on_shop_id", using: :btree

  create_table "pastry_pictures", force: :cascade do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "pastry_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pastry_pictures", ["pastry_id"], name: "index_pastry_pictures_on_pastry_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "description"
    t.string   "preparation_address"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "preparation_city"
    t.string   "preparation_zip_code"
  end

  add_index "shops", ["user_id"], name: "index_shops_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "",    null: false
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "description"
    t.string   "zip_code"
    t.string   "phone_number"
    t.datetime "pastrycook_confirmed_at"
    t.boolean  "pastrycook",              default: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pastries", "shops"
  add_foreign_key "pastry_pictures", "pastries"
  add_foreign_key "shops", "users"
end
