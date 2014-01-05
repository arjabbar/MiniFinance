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

ActiveRecord::Schema.define(version: 20140103023920) do

  create_table "billers", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchanges", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount_in_cents"
    t.boolean  "recurring"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "biller_id"
    t.string   "source"
  end

  add_index "exchanges", ["biller_id"], name: "index_exchanges_on_biller_id"
  add_index "exchanges", ["user_id"], name: "index_exchanges_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "image_url"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "session_expires_on"
  end

end
