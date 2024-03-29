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

ActiveRecord::Schema.define(version: 2020_12_08_092344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.integer "question_id"
    t.boolean "right", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_experts_on_email", unique: true
  end

  create_table "interviews", force: :cascade do |t|
    t.datetime "datetime_stamp"
    t.string "date_string"
    t.string "time_string"
    t.string "zoom_room_id"
    t.integer "expert_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zoom_start_url"
    t.string "zoom_join_url"
    t.string "room_password"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.integer "user_question_id"
    t.boolean "right", default: false
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_questions", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.integer "user_test_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "answered", default: false
    t.boolean "answered_right", default: false
    t.string "user_answer_text"
    t.integer "user_answered_id"
  end

  create_table "user_tests", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birth_date"
    t.string "city"
    t.string "education"
    t.string "arab_study"
    t.boolean "movement_help", default: false
    t.string "phone", default: "", null: false
    t.text "social_links"
    t.string "competition_source"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "test_token"
    t.string "interview_token"
    t.string "total_score"
    t.string "expert_review_doc"
    t.boolean "second_stage", default: false
    t.boolean "arab_relatives", default: false
    t.string "interview_cancel"
    t.string "middle_score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

end
