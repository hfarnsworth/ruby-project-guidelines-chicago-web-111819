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

ActiveRecord::Schema.define(version: 6) do

  create_table "drafts", force: :cascade do |t|
    t.integer "script_id"
    t.integer "writer_id"
  end

  create_table "producers", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "scripts", force: :cascade do |t|
    t.string  "project_name"
    t.string  "working_title"
    t.integer "producer_id"
    t.boolean "greenlit"
    t.string  "genre"
    t.string  "description"
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

  create_table "writers", force: :cascade do |t|
    t.integer "user_id"
  end

end
