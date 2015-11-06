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

ActiveRecord::Schema.define(version: 20151106135204) do

  create_table "advices", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "img",         limit: 255
    t.text     "content",     limit: 65535
    t.string   "video_url",   limit: 255
    t.string   "advice_type", limit: 255
    t.string   "state",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "name",            limit: 255
    t.string   "grade",           limit: 255
    t.string   "avatar",          limit: 255
    t.text     "desc",            limit: 65535
    t.string   "hospital",        limit: 255
    t.string   "department",      limit: 255
    t.string   "state",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "img",        limit: 255
    t.text     "content",    limit: 65535
    t.string   "video_url",  limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "img",        limit: 255
    t.text     "content",    limit: 65535
    t.string   "video_url",  limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "cell",            limit: 255
    t.string   "name",            limit: 255
    t.text     "address",         limit: 65535
    t.string   "gender",          limit: 255
    t.string   "id_no",           limit: 255
    t.string   "card_no",         limit: 255
    t.integer  "doctor_id",       limit: 4
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["doctor_id"], name: "index_users_on_doctor_id", using: :btree

  add_foreign_key "users", "doctors"
end
