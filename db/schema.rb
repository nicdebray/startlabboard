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

ActiveRecord::Schema.define(version: 2019_06_09_122414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "photo"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "motivation"
    t.bigint "job_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["job_offer_id"], name: "index_job_applications_on_job_offer_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "job_offers", force: :cascade do |t|
    t.string "company_name"
    t.string "category"
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "published", default: true
    t.index ["company_id"], name: "index_job_offers_on_company_id"
  end

  create_table "usercompanies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_usercompanies_on_company_id"
    t.index ["user_id"], name: "index_usercompanies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "job_applications", "job_offers"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_offers", "companies"
  add_foreign_key "usercompanies", "companies"
  add_foreign_key "usercompanies", "users"
end
