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

ActiveRecord::Schema.define(version: 20180213180703) do

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc_image_file_name"
    t.string "doc_image_content_type"
    t.integer "doc_image_file_size"
    t.datetime "doc_image_updated_at"
    t.string "doc_file_file_name"
    t.string "doc_file_content_type"
    t.integer "doc_file_file_size"
    t.datetime "doc_file_updated_at"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "bio"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "university"
    t.string "degree"
    t.integer "grad_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
