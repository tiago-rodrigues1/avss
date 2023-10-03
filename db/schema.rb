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

ActiveRecord::Schema[7.0].define(version: 2023_10_03_180742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "circuit_applications", force: :cascade do |t|
    t.bigint "circuit_id", null: false
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["circuit_id"], name: "index_circuit_applications_on_circuit_id"
  end

  create_table "circuit_stations", force: :cascade do |t|
    t.bigint "station_id", null: false
    t.bigint "circuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_circuit_stations_on_circuit_id"
    t.index ["station_id"], name: "index_circuit_stations_on_station_id"
  end

  create_table "circuit_submissions", force: :cascade do |t|
    t.bigint "circuit_application_id", null: false
    t.string "name"
    t.string "email"
    t.string "registration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_application_id"], name: "index_circuit_submissions_on_circuit_application_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "title"
    t.text "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_circuits_on_user_id"
  end

  create_table "question_alternatives", force: :cascade do |t|
    t.text "body"
    t.bigint "question_id", null: false
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_alternatives_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "statement"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "station_id", null: false
    t.index ["station_id"], name: "index_questions_on_station_id"
  end

  create_table "station_submissions", force: :cascade do |t|
    t.bigint "circuit_submission_id", null: false
    t.bigint "station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_submission_id"], name: "index_station_submissions_on_circuit_submission_id"
    t.index ["station_id"], name: "index_station_submissions_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.text "context"
    t.text "procedure"
    t.text "evaluation"
    t.integer "time"
    t.integer "difficulty"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "feedback"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_stations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "circuit_applications", "circuits"
  add_foreign_key "circuit_stations", "circuits"
  add_foreign_key "circuit_stations", "stations"
  add_foreign_key "circuit_submissions", "circuit_applications"
  add_foreign_key "circuits", "users"
  add_foreign_key "question_alternatives", "questions"
  add_foreign_key "questions", "stations"
  add_foreign_key "station_submissions", "circuit_submissions"
  add_foreign_key "station_submissions", "stations"
  add_foreign_key "stations", "users"
end
