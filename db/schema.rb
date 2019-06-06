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

ActiveRecord::Schema.define(version: 2019_06_06_232243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title", null: false
    t.integer "year", null: false
    t.integer "band_id", null: false
    t.boolean "album_type", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_albums_on_band_id"
    t.index ["title"], name: "index_albums_on_title"
    t.index ["year"], name: "index_albums_on_year"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "album_id", null: false
    t.string "title", null: false
    t.integer "ord", null: false
    t.text "lyrics"
    t.boolean "type", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id", "ord"], name: "index_tracks_on_album_id_and_ord"
    t.index ["album_id"], name: "index_tracks_on_album_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["session_token"], name: "index_users_on_session_token"
    t.index ["user_name", "email"], name: "index_users_on_user_name_and_email"
    t.index ["user_name"], name: "index_users_on_user_name"
  end

end
