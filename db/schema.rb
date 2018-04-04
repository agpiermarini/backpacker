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

ActiveRecord::Schema.define(version: 20180404193827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destination_images", force: :cascade do |t|
    t.bigint "destination_id"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_destination_images_on_destination_id"
    t.index ["image_id"], name: "index_destination_images_on_image_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "title"
    t.text "notes"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["country_id"], name: "index_destinations_on_country_id"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "name"
    t.text "url"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "destination_images", "destinations"
  add_foreign_key "destination_images", "images"
  add_foreign_key "destinations", "countries"
  add_foreign_key "destinations", "users"
end
