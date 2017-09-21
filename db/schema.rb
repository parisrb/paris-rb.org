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

ActiveRecord::Schema.define(version: 20170812155652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username",   limit: 255
    t.integer  "item"
    t.string   "table",      limit: 255
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "website",    limit: 255
    t.string   "logo",       limit: 255
    t.datetime "from"
    t.datetime "until"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.string   "speaker_name",         limit: 255
    t.string   "speaker_email",        limit: 255
    t.string   "level",                limit: 255
    t.string   "duration",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "happened_at"
    t.string   "slides",               limit: 255
    t.string   "video_url",            limit: 255
    t.string   "speaker_twitter",      limit: 255
    t.string   "preferred_month_talk", limit: 255
    t.datetime "time_position"
  end

  add_index "talks", ["happened_at"], name: "index_talks_on_happened_at", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.string   "text",           limit: 255
    t.string   "author",         limit: 255
    t.string   "twitter_handle", limit: 255
    t.string   "cool_projects",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "vimeo_url",       limit: 255
    t.string   "vimeo_thumbnail", limit: 255
    t.string   "title",           limit: 255
    t.text     "description"
    t.date     "event_date"
    t.string   "slug",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree

end
