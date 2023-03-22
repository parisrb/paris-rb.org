# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_22_213633) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.integer "item"
    t.string "table"
    t.integer "month", limit: 2
    t.bigint "year"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["item", "table", "month", "year"], name: "index_rails_admin_histories"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "logo"
    t.datetime "from", precision: nil
    t.datetime "until", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "talks", force: :cascade do |t|
    t.string "title"
    t.string "speaker_name"
    t.string "speaker_email"
    t.string "level"
    t.string "duration"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.date "happened_at"
    t.string "slides"
    t.string "video_url"
    t.string "speaker_twitter"
    t.string "preferred_month_talk"
    t.datetime "time_position", precision: nil
    t.index ["happened_at"], name: "index_talks_on_happened_at"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "text"
    t.string "author"
    t.string "twitter_handle"
    t.string "cool_projects"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "vimeo_url"
    t.string "vimeo_thumbnail"
    t.string "title"
    t.text "description"
    t.date "event_date"
    t.string "slug"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["slug"], name: "index_videos_on_slug", unique: true
  end

end
