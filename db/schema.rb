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

ActiveRecord::Schema.define(version: 20150518045038) do

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "state"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums", force: :cascade do |t|
    t.string   "photo_name"
    t.string   "description"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "albums", ["person_id"], name: "index_albums_on_person_id"

  create_table "cars", force: :cascade do |t|
    t.string   "color"
    t.string   "brand"
    t.string   "plate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars_people", id: false, force: :cascade do |t|
    t.integer "car_id",    null: false
    t.integer "person_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ci"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "twitter_url"
    t.string   "github_url"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["person_id"], name: "index_profiles_on_person_id"

end
