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

ActiveRecord::Schema[7.0].define(version: 2022_05_05_211359) do
  create_table "appearances", force: :cascade do |t|
    t.integer "meeting_id", null: false
    t.integer "host_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_appearances_on_host_id"
    t.index ["meeting_id"], name: "index_appearances_on_meeting_id"
  end

  create_table "associates", force: :cascade do |t|
    t.integer "meeting_id", null: false
    t.integer "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_associates_on_meeting_id"
    t.index ["participant_id"], name: "index_associates_on_participant_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "respond"
  end

  add_foreign_key "appearances", "hosts"
  add_foreign_key "appearances", "meetings"
  add_foreign_key "associates", "meetings"
  add_foreign_key "associates", "participants"
end
