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


ActiveRecord::Schema.define(version: 20140623025838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
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

  add_index "agenda_items", ["committee_id"], :name => "index_agenda_items_on_committee_id"
  add_index "agenda_items", ["council_member_id"], :name => "index_agenda_items_on_council_member_id"
  add_index "agenda_items", ["process_step_id"], :name => "index_agenda_items_on_process_step_id"

  create_table "committee_members", force: true do |t|
    t.integer  "committee_id"
    t.integer  "council_member_id"
    t.boolean  "chair"
    t.boolean  "vice_chair"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "committee_members", ["committee_id"], :name => "index_committee_members_on_committee_id"
  add_index "committee_members", ["council_member_id"], :name => "index_committee_members_on_council_member_id"

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
    t.integer  "committee_member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 100
  end

  add_index "council_members", ["committee_member_id"], :name => "index_council_members_on_committee_member_id"

  create_table "issues", force: true do |t|
    t.string   "name"
    t.string   "slug",       limit: 100
    t.string   "summary",    limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
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

end
