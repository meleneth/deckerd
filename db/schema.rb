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

ActiveRecord::Schema.define(version: 20140908005712) do

  create_table "magic_card_names", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_card_type_maps", force: true do |t|
    t.integer  "magic_card_name_id"
    t.integer  "magic_card_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_card_type_maps", ["magic_card_name_id"], name: "index_magic_card_type_maps_on_magic_card_name_id"
  add_index "magic_card_type_maps", ["magic_card_type_id"], name: "index_magic_card_type_maps_on_magic_card_type_id"

  create_table "magic_card_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_deck_cards", force: true do |t|
    t.integer  "magic_deck_id"
    t.integer  "magic_card_name_id"
    t.integer  "maindeck"
    t.integer  "sideboard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_deck_cards", ["magic_card_name_id"], name: "index_magic_deck_cards_on_magic_card_name_id"
  add_index "magic_deck_cards", ["magic_deck_id"], name: "index_magic_deck_cards_on_magic_deck_id"

  create_table "magic_decks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_project_cards", force: true do |t|
    t.integer  "magic_card_name_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_project_cards", ["magic_card_name_id"], name: "index_magic_project_cards_on_magic_card_name_id"

  create_table "magic_project_decks", force: true do |t|
    t.integer  "magic_project_id"
    t.integer  "magic_deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "magic_project_decks", ["magic_deck_id"], name: "index_magic_project_decks_on_magic_deck_id"
  add_index "magic_project_decks", ["magic_project_id"], name: "index_magic_project_decks_on_magic_project_id"

  create_table "magic_projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
