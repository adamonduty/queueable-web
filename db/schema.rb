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

ActiveRecord::Schema.define(:version => 20120429000046) do

  create_table "batches", :force => true do |t|
    t.string   "notes"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "uhash"
    t.string   "host"
    t.string   "processor"
    t.integer  "cores"
  end

  add_index "batches", ["platform_id"], :name => "index_batches_on_platform_id"

  create_table "platforms", :force => true do |t|
    t.string   "sysname"
    t.string   "release"
    t.string   "version"
    t.string   "machine"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "runs", :force => true do |t|
    t.string   "backend"
    t.integer  "threads"
    t.decimal  "seconds"
    t.integer  "msg_size"
    t.integer  "batch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "runs", ["batch_id"], :name => "index_runs_on_batch_id"

end
