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

ActiveRecord::Schema.define(:version => 20121125223158) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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
    t.string   "file"
  end

  create_table "entries_knowledge_areas", :id => false, :force => true do |t|
    t.integer "entry_id"
    t.integer "knowledge_area_id"
  end

  create_table "entries_research_sublines", :id => false, :force => true do |t|
    t.integer "entry_id"
    t.integer "research_subline_id"
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entry_id"
    t.integer  "result_id"
  end

  create_table "indicators", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "knowledge_areas_programs", :id => false, :force => true do |t|
    t.integer "program_id"
    t.integer "knowledge_area_id"
  end

  create_table "knowledge_areas_projects", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "knowledge_area_id"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "birthday"
    t.string   "phone"
    t.text     "about_me"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "program_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "title"
    t.text     "description",       :limit => 255
    t.integer  "research_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "program_type_id"
  end

  create_table "programs_research_sublines", :id => false, :force => true do |t|
    t.integer "program_id"
    t.integer "research_subline_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description", :limit => 255
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "program_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  create_table "projects_research_sublines", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "research_subline_id"
  end

  create_table "research_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_groups_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "research_group_id"
  end

  create_table "research_lines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "research_sublines", :force => true do |t|
    t.string   "name"
    t.integer  "research_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.integer  "user_id"
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
    t.integer  "knowledge_area_id"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
