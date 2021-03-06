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

ActiveRecord::Schema.define(version: 20160714123558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ewalls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "photo_id"
    t.string  "position_x"
    t.string  "position_y"
    t.string  "width"
    t.string  "height"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", using: :btree
  add_index "groups_users", ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.integer  "uploader_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "group_id"
  end

  add_index "photos", ["group_id"], name: "index_photos_on_group_id", using: :btree

  create_table "photos_users", id: false, force: :cascade do |t|
    t.integer "photo_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "photos_users", ["photo_id", "user_id"], name: "index_photos_users_on_photo_id_and_user_id", using: :btree
  add_index "photos_users", ["user_id", "photo_id"], name: "index_photos_users_on_user_id_and_photo_id", using: :btree

  create_table "stacks", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "email"
    t.text     "password_digest"
    t.integer  "role"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "photos", "groups"
end
