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

ActiveRecord::Schema.define(version: 20150104133828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "service_categories", force: true do |t|
    t.string  "title"
    t.string  "permalink"
    t.string  "ancestry"
    t.integer "position"
  end

  add_index "service_categories", ["ancestry"], name: "index_service_categories_on_ancestry", using: :btree

  create_table "service_images", force: true do |t|
    t.integer  "service_id"
    t.string   "image"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "service_images", ["position", "service_id"], name: "index_service_images_on_position_and_service_id", unique: true, using: :btree

  create_table "services", force: true do |t|
    t.integer  "vendor_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree
  add_index "services", ["vendor_id"], name: "index_services_on_vendor_id", using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "owner_id"
    t.integer  "vendor_id"
    t.date     "date"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
