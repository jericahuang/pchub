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

ActiveRecord::Schema.define(version: 20180531213250) do

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "platform"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "app_link"
    t.string   "repository_link"
    t.string   "slider_image_file_name"
    t.string   "slider_image_content_type"
    t.integer  "slider_image_file_size"
    t.datetime "slider_image_updated_at"
    t.string   "app_image_file_name"
    t.string   "app_image_content_type"
    t.integer  "app_image_file_size"
    t.datetime "app_image_updated_at"
    t.string   "short_description"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "application_id"
  end

  add_index "notifications", ["application_id"], name: "index_notifications_on_application_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "country"
    t.string   "state_or_province"
    t.string   "city"
    t.string   "profile_link"
    t.text     "additional_information"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "approved",               default: false, null: false
    t.string   "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
