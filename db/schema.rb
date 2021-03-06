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

ActiveRecord::Schema.define(version: 20160115014733) do

  create_table "articles", force: :cascade do |t|
    t.string   "page_refer"
    t.string   "title"
    t.string   "author"
    t.string   "translate"
    t.string   "site"
    t.string   "editor"
    t.string   "press"
    t.string   "print"
    t.string   "print_date"
    t.string   "kword"
    t.string   "book_size"
    t.decimal  "price"
    t.text     "remark"
    t.integer  "pages_num"
    t.string   "cateory"
    t.string   "journal"
    t.integer  "amount"
    t.string   "inner_flag"
    t.text     "text"
    t.text     "old_text"
    t.string   "bindery"
    t.string   "attr"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "converavatars"
    t.text     "printedavatars"
    t.text     "innerpageavatars"
    t.text     "copyrightavatars"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
