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

ActiveRecord::Schema.define(version: 2022_10_15_052212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: :cascade do |t|
    t.text "text", null: false
    t.integer "question_id", null: false
  end

  create_table "polls", force: :cascade do |t|
    t.string "title", null: false
    t76 .integer "user_id", null: false
    t.index ["title"], name: "index_polls_on_title"
  end

  create_table "questions", force: :cascade do |t|
    t.text "text", null: false
    t.integer "poll_id", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "answer_choice_id", null: false
    t.index ["answer_choice_id"], name: "index_responses_on_answer_choice_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
