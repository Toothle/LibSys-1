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

ActiveRecord::Schema.define(version: 20150925191011) do

  create_table "books", force: :cascade do |t|
    t.string   "ISBN"
    t.string   "title"
    t.string   "description"
    t.string   "author"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "member_id"
  end

  add_index "books", ["member_id"], name: "index_books_on_member_id"

  create_table "histories", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "book_id"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "histories", ["book_id"], name: "index_histories_on_book_id"
  add_index "histories", ["member_id", "book_id", "created_at"], name: "index_histories_on_member_id_and_book_id_and_created_at"
  add_index "histories", ["member_id"], name: "index_histories_on_member_id"

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password"
    t.boolean  "admin",      default: false
    t.boolean  "pre",        default: false
  end

  create_table "suggests", force: :cascade do |t|
    t.string   "ISBN"
    t.string   "title"
    t.string   "description"
    t.string   "author"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "ISBN"
    t.string   "title"
    t.string   "description"
    t.string   "author"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
