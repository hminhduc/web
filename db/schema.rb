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

ActiveRecord::Schema.define(version: 20150320025733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "JPT場所マスタ", force: :cascade do |t|
    t.string   "社員番号"
    t.string   "場所コード"
    t.string   "場所名"
    t.string   "場所名カナ"
    t.string   "SUB"
    t.string   "場所区分"
    t.string   "会社コード"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "JPT工程マスタ", force: :cascade do |t|
    t.string   "所属コード"
    t.string   "工程コード"
    t.string   "工程名"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "JPT状態マスタ", force: :cascade do |t|
    t.string   "状態コード"
    t.string   "状態名"
    t.string   "状態区分"
    t.string   "マーク"
    t.string   "色"
    t.string   "WEB使用区分"
    t.string   "勤怠使用区分"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
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

  create_table "event", force: :cascade do |t|
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

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position",   limit: 50
    t.string   "office",     limit: 50
    t.integer  "age"
    t.integer  "start_date"
    t.decimal  "salary"
  end

  create_table "作業場所マスタ", force: :cascade do |t|
    t.string   "作業場所コード"
    t.string   "作業場所名"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "工程マスタ", force: :cascade do |t|
    t.string   "分類"
    t.string   "コード"
    t.string   "工程名"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "所在マスタ", force: :cascade do |t|
    t.string   "所在コード"
    t.string   "所在名"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "担当者マスタ", force: :cascade do |t|
    t.string   "担当者コード"
    t.string   "担当者名称"
    t.string   "パスワード"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
