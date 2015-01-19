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

ActiveRecord::Schema.define(version: 20150119165218) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title",        null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "amazon_url"
    t.string   "small_image"
    t.string   "medium_image"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name",                               null: false
    t.string   "description"
    t.integer  "current_book_id"
    t.string   "visibility",      default: "public", null: false
    t.integer  "organizer_id",                       null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    null: false
    t.integer  "user_id",    null: false
    t.integer  "club_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.integer  "book_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "location",     null: false
    t.string   "meeting_time", null: false
    t.integer  "club_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id",      null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                                 null: false
    t.string   "name",                                null: false
    t.string   "oauth_token",                         null: false
    t.datetime "oauth_expires_at",                    null: false
    t.string   "role",             default: "member"
    t.string   "favorite_authors"
    t.string   "favorite_books"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email"
  end

end
