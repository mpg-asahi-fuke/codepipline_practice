# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_15_063117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_admins_on_email_address", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ir_report_summaries", force: :cascade do |t|
    t.bigint "ir_report_id", null: false
    t.text "content", null: false
    t.integer "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ir_report_id"], name: "index_ir_report_summaries_on_ir_report_id"
  end

  create_table "ir_reports", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.date "published_at", null: false
    t.string "title", null: false
    t.text "content"
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_ir_reports_on_company_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "ip_address"
    t.string "admin_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_sessions_on_admin_id"
  end

  add_foreign_key "ir_report_summaries", "ir_reports"
  add_foreign_key "ir_reports", "companies"
  add_foreign_key "sessions", "admins"
end
