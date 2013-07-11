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

ActiveRecord::Schema.define(:version => 20130711130618) do

  create_table "access_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attempts", :force => true do |t|
    t.integer  "webhook_id", :null => false
    t.boolean  "success",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "error_id"
  end

  create_table "consumers", :force => true do |t|
    t.integer  "producer_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name",        :null => false
  end

  create_table "errors", :force => true do |t|
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "errors", ["message"], :name => "errors_message_index", :length => {"message"=>16}

  create_table "producers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "owner_id",   :null => false
    t.string   "name",       :null => false
  end

  create_table "producers_users", :force => true do |t|
    t.integer "user_id"
    t.integer "producer_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "webhooks", :force => true do |t|
    t.text     "post_data",   :null => false
    t.integer  "consumer_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "failed",      :null => false
    t.boolean  "attempt",     :null => false
    t.string   "post_uri",    :null => false
  end

end
