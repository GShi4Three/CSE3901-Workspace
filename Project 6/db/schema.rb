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

ActiveRecord::Schema[8.0].define(version: 2024_12_02_210735) do
  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.string "semester", null: false
    t.integer "instructor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "presentation_id", null: false
    t.integer "evaluator_id", null: false
    t.integer "content_score", null: false
    t.integer "organization_score", null: false
    t.integer "pacing_score", null: false
    t.integer "professionalism_score", null: false
    t.integer "total_score", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluator_id"], name: "index_evaluations_on_evaluator_id"
    t.index ["presentation_id"], name: "index_evaluations_on_presentation_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "date"
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_presentations_on_created_by_id"
  end

  create_table "presentations_members", force: :cascade do |t|
    t.integer "presentation_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_presentations_members_on_presentation_id"
    t.index ["user_id"], name: "index_presentations_members_on_user_id"
  end

  create_table "rosters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "enrolled_on", null: false
    t.datetime "dropped_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_rosters_on_course_id"
    t.index ["user_id"], name: "index_rosters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "role", default: "student", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "courses", "users", column: "instructor_id"
  add_foreign_key "evaluations", "evaluators"
  add_foreign_key "evaluations", "presentations"
  add_foreign_key "presentations", "users", column: "created_by_id"
  add_foreign_key "presentations_members", "presentations"
  add_foreign_key "presentations_members", "users"
  add_foreign_key "rosters", "courses"
  add_foreign_key "rosters", "users"
end
