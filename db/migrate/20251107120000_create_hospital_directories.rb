class CreateHospitalDirectories < ActiveRecord::Migration[7.0]
  def change
    create_table :hospital_directories do |t|
      t.integer :sr_no, index: { unique: true }
      t.string  :location_coordinates
      t.string  :location
      t.string  :hospital_name
      t.string  :hospital_category
      t.string  :hospital_care_type
      t.text    :discipline_systems_of_medicine
      t.text    :address_original_first_line
      t.string  :state
      t.string  :district
      t.string  :subdistrict
      t.string  :pincode
      t.string  :telephone
      t.string  :mobile_number
      t.string  :emergency_num
      t.string  :ambulance_phone_no
      t.string  :bloodbank_phone_no
      t.string  :foreign_pcare
      t.string  :tollfree
      t.string  :helpline
      t.string  :hospital_fax
      t.string  :hospital_primary_email_id
      t.string  :hospital_secondary_email_id
      t.string  :website
      t.text    :specialties
      t.text    :facilities
      t.string  :accreditation
      t.string  :hospital_regis_number
      t.string  :registeration_number_scan
      t.string  :nodal_person_info
      t.string  :nodal_person_tele
      t.string  :nodal_person_email_id
      t.string  :town
      t.string  :subtown
      t.string  :village
      t.string  :establised_year
      t.string  :ayush
      t.text    :miscellaneous_facilities
      t.integer :number_doctor
      t.integer :num_mediconsultant_or_expert
      t.integer :total_num_beds
      t.integer :number_private_wards
      t.integer :num_bed_for_eco_weaker_sec
      t.string  :empanelment_or_collaboration_with
      t.string  :emergency_services
      t.string  :tariff_range
      t.integer :state_id
      t.integer :district_id

      t.timestamps
    end
  end
end
