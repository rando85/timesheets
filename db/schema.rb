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

ActiveRecord::Schema.define(version: 2021_01_17_052036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultants", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_consultants_on_slug", unique: true
    t.index ["team_id"], name: "index_consultants_on_team_id"
  end

  create_table "daily_hours", force: :cascade do |t|
    t.decimal "hours"
    t.text "issue"
    t.bigint "day_id", null: false
    t.bigint "consultant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultant_id"], name: "index_daily_hours_on_consultant_id"
    t.index ["day_id"], name: "index_daily_hours_on_day_id"
  end

  create_table "days", force: :cascade do |t|
    t.bigint "week_id", null: false
    t.bigint "month_id", null: false
    t.string "date_str"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["month_id"], name: "index_days_on_month_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "months", force: :cascade do |t|
    t.bigint "year_id", null: false
    t.text "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_months_on_year_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.string "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_reasons_on_slug", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_teams_on_slug", unique: true
  end

  create_table "vacations", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "consultant_id", null: false
    t.bigint "reason_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultant_id"], name: "index_vacations_on_consultant_id"
    t.index ["day_id"], name: "index_vacations_on_day_id"
    t.index ["reason_id"], name: "index_vacations_on_reason_id"
  end

  create_table "weekly_hours", force: :cascade do |t|
    t.decimal "hours"
    t.text "issue"
    t.bigint "day_id", null: false
    t.bigint "consultant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultant_id"], name: "index_weekly_hours_on_consultant_id"
    t.index ["day_id"], name: "index_weekly_hours_on_day_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.string "week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "consultants", "teams"
  add_foreign_key "daily_hours", "consultants"
  add_foreign_key "daily_hours", "days"
  add_foreign_key "days", "months"
  add_foreign_key "days", "weeks"
  add_foreign_key "months", "years"
  add_foreign_key "vacations", "consultants"
  add_foreign_key "vacations", "days"
  add_foreign_key "vacations", "reasons"
  add_foreign_key "weekly_hours", "consultants"
  add_foreign_key "weekly_hours", "days"
end
