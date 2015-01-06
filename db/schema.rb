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

ActiveRecord::Schema.define(version: 20150105141857) do

  create_table "actions", force: true do |t|
    t.string   "name"
    t.datetime "date_from"
    t.datetime "date_to"
    t.string   "discount_type"
    t.float    "discount_value"
    t.integer  "tag_id"
    t.integer  "product_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actions", ["date_from"], name: "index_actions_on_date_from"
  add_index "actions", ["date_to"], name: "index_actions_on_date_to"

  create_table "carts", force: true do |t|
    t.string   "session_id"
    t.integer  "product_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["session_id"], name: "index_carts_on_session_id"

  create_table "product_tags", force: true do |t|
    t.integer  "product_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_tags", ["product_id", "tag_id"], name: "index_product_tags_on_product_id_and_tag_id", unique: true
  add_index "product_tags", ["product_id"], name: "index_product_tags_on_product_id"
  add_index "product_tags", ["tag_id"], name: "index_product_tags_on_tag_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
