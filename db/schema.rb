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

ActiveRecord::Schema.define(:version => 20120710032245) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.boolean  "published"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "entries_research_lines", :id => false, :force => true do |t|
    t.integer "entry_id"
    t.integer "research_line_id"
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entry_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "birthday"
    t.string   "phone"
    t.text     "about_me"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_lines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                       :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "failed_logins_count",          :default => 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.integer  "department_id"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
