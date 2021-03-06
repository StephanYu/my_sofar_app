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

ActiveRecord::Schema.define(version: 20161003145608) do

  create_table "artists", force: :cascade do |t|
    t.integer  "artist_uid"
    t.string   "title"
    t.string   "cached_slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["artist_uid"], name: "index_artists_on_artist_uid", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "city_uid"
    t.string   "title"
    t.string   "cached_slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_uid"], name: "index_cities_on_city_uid", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "song_uid"
    t.string   "title"
    t.text     "description"
    t.string   "cached_slug"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["city_id"], name: "index_songs_on_city_id"
    t.index ["song_uid"], name: "index_songs_on_song_uid", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string   "video_uid"
    t.string   "title"
    t.string   "published_at"
    t.text     "thumb_url"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_videos_on_song_id"
    t.index ["video_uid"], name: "index_videos_on_video_uid", unique: true
  end

end
