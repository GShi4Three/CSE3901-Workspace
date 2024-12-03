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

ActiveRecord::Schema[8.0].define(version: 2024_12_03_001359) do
  create_table "evaluations", force: :cascade do |t|
    t.integer "content_score"
    t.integer "organization_score"
    t.integer "time_pacing_score"
    t.integer "professionalism_score"
    t.text "comments"
    t.integer "user_id", null: false
    t.integer "presentation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_evaluations_on_presentation_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "presentation_creators", force: :cascade do |t|
    t.integer "presentation_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_presentation_creators_on_presentation_id"
    t.index ["user_id"], name: "index_presentation_creators_on_user_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evaluations", "presentations"
  add_foreign_key "evaluations", "users"
  add_foreign_key "presentation_creators", "presentations"
  add_foreign_key "presentation_creators", "users"
end
