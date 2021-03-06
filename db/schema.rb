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

ActiveRecord::Schema.define(version: 20160930160854) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.integer "event_id"
    t.integer "category_id"
  end

  create_table "event_venues", force: :cascade do |t|
    t.integer "event_id"
    t.integer "venue_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "capacity"
    t.integer  "user_id"
    t.datetime "eventtime"
  end

  create_table "user_registers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.boolean "checkedin", default: false
    t.string  "lastname"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "company"
    t.string   "relation"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
