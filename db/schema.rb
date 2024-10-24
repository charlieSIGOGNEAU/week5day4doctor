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

ActiveRecord::Schema[7.2].define(version: 2024_10_24_094724) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.integer "dddoctor_id"
    t.integer "patient_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_appointments_on_city_id"
    t.index ["dddoctor_id"], name: "index_appointments_on_dddoctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "cities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "dddoctor_specialties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dddoctor_id"
    t.integer "specialty_id"
    t.index ["dddoctor_id"], name: "index_dddoctor_specialties_on_dddoctor_id"
    t.index ["specialty_id"], name: "index_dddoctor_specialties_on_specialty_id"
  end

  create_table "dddoctors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "zip_code"
    t.integer "city_id"
    t.index ["city_id"], name: "index_dddoctors_on_city_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "city_id"
    t.index ["city_id"], name: "index_patients_on_city_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "dddoctor_id"
    t.index ["dddoctor_id"], name: "index_specialties_on_dddoctor_id"
  end

  add_foreign_key "appointments", "cities"
  add_foreign_key "dddoctors", "cities"
  add_foreign_key "patients", "cities"
end
