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

ActiveRecord::Schema.define(version: 20171018153037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "department_id"
    t.integer "category"
    t.integer "target_grade"
    t.integer "total_unit"
    t.integer "lecture_unit"
    t.integer "lab_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lecture_id"
    t.text "comment"
    t.integer "score", default: 0
    t.integer "easiness", default: 0
    t.integer "grading", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_evaluations_on_lecture_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.integer "course_id"
    t.float "score", default: 0.0
    t.float "easiness", default: 0.0
    t.float "grading", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lectures_on_course_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "year"
    t.integer "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end