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

ActiveRecord::Schema[7.1].define(version: 2023_04_09_062149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_actions_on_challenge_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_activities_on_event_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "layout", default: 0
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "note_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_categories_on_note_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_notes", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "note_id", null: false
    t.index ["category_id", "note_id"], name: "index_categories_notes_on_category_id_and_note_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day", default: 1, null: false
    t.index ["program_id"], name: "index_challenges_on_program_id"
  end

  create_table "enrolled_programs", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_enrolled_programs_on_program_id"
    t.index ["user_id"], name: "index_enrolled_programs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "enrolled_program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrolled_program_id"], name: "index_events_on_enrolled_program_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_exercises_on_activity_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "code"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "content"
    t.bigint "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["board_id"], name: "index_notes_on_board_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "difficulty"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "user_id", null: false
    t.bigint "enrolled_program_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enrolled_program_id"], name: "index_progresses_on_enrolled_program_id"
    t.index ["event_id"], name: "index_progresses_on_event_id"
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.text "bio"
    t.date "birthday"
    t.string "invite_code"
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "actions", "challenges"
  add_foreign_key "activities", "events"
  add_foreign_key "boards", "users"
  add_foreign_key "categories", "notes"
  add_foreign_key "categories", "users"
  add_foreign_key "challenges", "programs"
  add_foreign_key "enrolled_programs", "programs"
  add_foreign_key "enrolled_programs", "users"
  add_foreign_key "events", "enrolled_programs"
  add_foreign_key "exercises", "activities"
  add_foreign_key "notes", "boards"
  add_foreign_key "notes", "users"
  add_foreign_key "progresses", "enrolled_programs"
  add_foreign_key "progresses", "events"
  add_foreign_key "progresses", "users"
end
