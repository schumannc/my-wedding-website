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

ActiveRecord::Schema.define(version: 20160219010421) do

  create_table "admins", force: :cascade do |t|
    t.string   "user"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "confirmations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "guets"
    t.string   "phone"
    t.string   "ip"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "email_confirmed", default: true
    t.string   "confirm_token"
  end

  add_index "confirmations", ["email"], name: "index_confirmations_on_email"

  create_table "line_items", force: :cascade do |t|
    t.decimal  "valor",       precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "presente_id"
    t.string   "item"
    t.string   "url"
    t.decimal  "arrecadado",  precision: 8, scale: 2, default: 0.0
    t.string   "image_url"
  end

  add_index "line_items", ["presente_id"], name: "index_line_items_on_presente_id"

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "text"
    t.boolean  "confirmation", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "email"
    t.decimal  "amount"
    t.integer  "presente_id"
    t.integer  "line_item_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "name"
    t.text     "mensagem"
    t.text     "description"
    t.boolean  "sucesso",      default: false
    t.boolean  "pagseguro",    default: false
    t.string   "url"
  end

  add_index "orders", ["line_item_id"], name: "index_orders_on_line_item_id"
  add_index "orders", ["presente_id"], name: "index_orders_on_presente_id"

  create_table "presentes", force: :cascade do |t|
    t.string   "item"
    t.string   "image_url"
    t.text     "description"
    t.text     "details"
    t.decimal  "total",       precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "url"
    t.decimal  "arrecadado",  precision: 8, scale: 2, default: 0.0
  end

  add_index "presentes", ["url"], name: "presente_url"

  create_table "widgets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
