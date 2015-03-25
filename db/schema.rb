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

ActiveRecord::Schema.define(version: 20150325090151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employer", force: :cascade do |t|
    t.string   "first_name"
    t.string   "position"
    t.string   "office"
    t.integer  "age"
    t.date     "start_date"
    t.decimal  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "order_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "作業場所マスタ", force: :cascade do |t|
    t.string   "作業場所コード",    limit: 255
    t.string   "作業場所名",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "場所マスタ", force: :cascade do |t|
    t.string   "社員番号"
    t.string   "場所コード"
    t.string   "場所名"
    t.string   "場所名カナ"
    t.string   "SUB"
    t.string   "場所区分"
    t.string   "会社コード"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "工程マスタ", force: :cascade do |t|
    t.string   "所属コード"
    t.string   "工程コード"
    t.string   "工程名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "所在マスタ", force: :cascade do |t|
    t.string   "所在コード",      limit: 255
    t.string   "所在名",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "担当者マスタ", force: :cascade do |t|
    t.string   "担当者コード",     limit: 255
    t.string   "担当者名称",      limit: 255
    t.string   "パスワード",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      limit: 50
  end

  create_table "状態マスタ", force: :cascade do |t|
    t.string   "状態コード"
    t.string   "状態名"
    t.string   "状態区分"
    t.string   "勤怠状態名"
    t.string   "マーク"
    t.string   "色"
    t.string   "WEB使用区分"
    t.string   "勤怠使用区分"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
