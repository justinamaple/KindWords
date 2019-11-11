# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_11_213217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "letters", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "content"
    t.boolean "burned", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "num_views", default: 0
    t.integer "num_responses", default: 0
    t.string "icon"
    t.index ["account_id"], name: "index_letters_on_account_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "letter_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
    t.index ["account_id"], name: "index_responses_on_account_id"
    t.index ["letter_id"], name: "index_responses_on_letter_id"
  end

  create_table "seens", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "letter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_seens_on_account_id"
    t.index ["letter_id"], name: "index_seens_on_letter_id"
  end

  add_foreign_key "letters", "accounts"
  add_foreign_key "responses", "accounts"
  add_foreign_key "responses", "letters"
  add_foreign_key "seens", "accounts"
  add_foreign_key "seens", "letters"
end
