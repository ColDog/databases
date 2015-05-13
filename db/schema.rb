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

ActiveRecord::Schema.define(version: 20150513003406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "paid",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "class_lists", ["course_id"], name: "index_class_lists_on_course_id", using: :btree
  add_index "class_lists", ["user_id"], name: "index_class_lists_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "category"
    t.string   "boat"
    t.integer  "size"
    t.string   "dates"
    t.integer  "year"
    t.integer  "price"
    t.string   "location"
    t.string   "title"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "age_group"
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "courses", ["code"], name: "index_courses_on_code", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "age"
    t.string   "phone"
    t.text     "health_notes"
    t.string   "password_digest"
    t.boolean  "staff",           default: false
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "waiver",          default: false
  end

  add_foreign_key "class_lists", "courses"
  add_foreign_key "class_lists", "users"
end
