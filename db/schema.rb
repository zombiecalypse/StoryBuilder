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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110909212313) do

# Could not dump table "characters" because of following StandardError
#   Unknown type 'reference' for column 'image'

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["image_id"], :name => "index_locations_on_image_id"

  create_table "relations", :force => true do |t|
    t.integer  "character_id"
    t.integer  "towards_id"
    t.string   "short"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relations", ["character_id"], :name => "index_relations_on_character_id"
  add_index "relations", ["towards_id"], :name => "index_relations_on_towards_id"

  create_table "roles", :force => true do |t|
    t.integer  "character_id"
    t.integer  "story_id"
    t.string   "role"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["character_id"], :name => "index_roles_on_character_id"
  add_index "roles", ["story_id"], :name => "index_roles_on_story_id"

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "mood"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "superplot_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

end
