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

ActiveRecord::Schema.define(:version => 20110720144853) do

  create_table "editions", :force => true do |t|
    t.string   "title"
    t.integer  "edition_no"
    t.date     "publish_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    :default => false
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "link_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "firstname"
    t.string   "lastname"
    t.string   "group"
    t.string   "writer_type"
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.text     "bio"
    t.text     "bio_tt"
    t.boolean  "old_style",                                :default => false
  end

  create_table "works", :force => true do |t|
    t.string   "work_type"
    t.string   "title"
    t.text     "abstract"
    t.text     "work_content"
    t.integer  "edition_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "epigraph"
    t.string   "attachment1_file_name"
    t.string   "attachment1_content_type"
    t.integer  "attachment1_file_size"
    t.datetime "attachment1_updated_at"
    t.integer  "ordinal",                  :default => 0
    t.text     "abstract_tt"
    t.string   "title_tt"
    t.text     "work_content_tt"
    t.text     "epigraph_tt"
    t.boolean  "old_style",                :default => false
  end

end
