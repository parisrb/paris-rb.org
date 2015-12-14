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

ActiveRecord::Schema.define(version: 20151214194047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "logo"
    t.datetime "from"
    t.datetime "until"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", force: true do |t|
    t.string   "title"
    t.string   "speaker_name"
    t.string   "speaker_email"
    t.string   "level"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "happened_at"
    t.string   "slides"
    t.string   "video_url"
    t.integer  "position"
  end

  add_index "talks", ["happened_at"], name: "index_talks_on_happened_at", using: :btree

  create_table "tweets", force: true do |t|
    t.string   "text"
    t.string   "author"
    t.string   "twitter_handle"
    t.string   "cool_projects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "vimeo_url"
    t.string   "vimeo_thumbnail"
    t.string   "title"
    t.text     "description"
    t.date     "event_date"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree

end
