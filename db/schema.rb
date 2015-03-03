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

ActiveRecord::Schema.define(version: 20150226064749) do

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
    t.datetime "start_date"
    t.decimal  "salary"
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

  create_table "工程マスタ", force: :cascade do |t|
    t.string   "分類",         limit: 255
    t.string   "コード",        limit: 255
    t.string   "工程名",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
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

end
