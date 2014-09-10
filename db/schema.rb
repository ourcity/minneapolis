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

ActiveRecord::Schema.define(version: 20140903032715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "agenda_items", force: true do |t|
    t.string   "title"
    t.string   "description",       limit: 1000
    t.string   "report_url"
    t.string   "action"
    t.integer  "issue_id"
    t.datetime "acted_on"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "process_step_id"
    t.integer  "committee_id"
    t.integer  "council_member_id"
  end

  add_index "agenda_items", ["committee_id"], name: "index_agenda_items_on_committee_id", using: :btree
  add_index "agenda_items", ["council_member_id"], name: "index_agenda_items_on_council_member_id", using: :btree
  add_index "agenda_items", ["process_step_id"], name: "index_agenda_items_on_process_step_id", using: :btree

  create_table "committee_members", force: true do |t|
    t.integer  "committee_id"
    t.integer  "council_member_id"
    t.boolean  "chair"
    t.boolean  "vice_chair"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "committee_members", ["committee_id"], name: "index_committee_members_on_committee_id", using: :btree
  add_index "committee_members", ["council_member_id"], name: "index_committee_members_on_council_member_id", using: :btree

  create_table "committees", force: true do |t|
    t.string   "name"
    t.string   "comm_type"
    t.string   "info_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 150
  end

  create_table "council_members", force: true do |t|
    t.string   "ward"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 100
  end

  create_table "issues", force: true do |t|
    t.string   "name"
    t.string   "slug",       limit: 100
    t.string   "summary",    limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.string   "lonlat"
    t.json     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "description"
    t.json     "store"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_steps", force: true do |t|
    t.string   "short_name"
    t.text     "description"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_links", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "agenda_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "subscribable_id"
    t.string   "subscribable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "digest"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "street"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
