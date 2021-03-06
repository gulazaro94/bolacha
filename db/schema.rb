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

ActiveRecord::Schema.define(version: 20141023183711) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.boolean  "repeated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["item_id", "user_id"], name: "index_collections_on_item_id_and_user_id", unique: true
  add_index "collections", ["item_id"], name: "index_collections_on_item_id"
  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "items", force: true do |t|
    t.string   "picture"
    t.string   "description"
    t.boolean  "kind"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "picture"
    t.date     "birth_date"
    t.text     "bio"
    t.boolean  "admin"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
