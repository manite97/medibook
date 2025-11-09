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

ActiveRecord::Schema[7.2].define(version: 2025_11_07_121500) do
  create_table "hospital_directories", charset: "utf8mb3", force: :cascade do |t|
    t.string "sr_no"
    t.string "location_coordinates"
    t.string "location"
    t.string "hospital_name"
    t.string "hospital_category"
    t.string "hospital_care_type"
    t.text "discipline_systems_of_medicine"
    t.text "address_original_first_line"
    t.string "state"
    t.string "district"
    t.string "subdistrict"
    t.string "pincode"
    t.string "telephone"
    t.string "mobile_number"
    t.string "emergency_num"
    t.string "ambulance_phone_no"
    t.string "bloodbank_phone_no"
    t.string "foreign_pcare"
    t.string "tollfree"
    t.string "helpline"
    t.string "hospital_fax"
    t.string "hospital_primary_email_id"
    t.string "hospital_secondary_email_id"
    t.string "website"
    t.text "specialties"
    t.text "facilities"
    t.string "accreditation"
    t.string "hospital_regis_number"
    t.string "registeration_number_scan"
    t.string "nodal_person_info"
    t.string "nodal_person_tele"
    t.string "nodal_person_email_id"
    t.string "town"
    t.string "subtown"
    t.string "village"
    t.string "establised_year"
    t.string "ayush"
    t.text "miscellaneous_facilities"
    t.string "number_doctor"
    t.string "num_mediconsultant_or_expert"
    t.string "total_num_beds"
    t.string "number_private_wards"
    t.string "num_bed_for_eco_weaker_sec"
    t.string "empanelment_or_collaboration_with"
    t.string "emergency_services"
    t.string "tariff_range"
    t.string "state_id"
    t.string "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sr_no"], name: "index_hospital_directories_on_sr_no", unique: true
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name"
  end
end
