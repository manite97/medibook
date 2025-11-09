class ChangeHospitalIntegerFieldsToString < ActiveRecord::Migration[7.0]
  def up
    change_column :hospital_directories, :sr_no, :string
    change_column :hospital_directories, :number_doctor, :string
    change_column :hospital_directories, :num_mediconsultant_or_expert, :string
    change_column :hospital_directories, :total_num_beds, :string
    change_column :hospital_directories, :number_private_wards, :string
    change_column :hospital_directories, :num_bed_for_eco_weaker_sec, :string
    change_column :hospital_directories, :state_id, :string
    change_column :hospital_directories, :district_id, :string
  end

  def down
    # When converting back to integer we attempt to cast existing string values to signed integers.
    # If strings are non-numeric this may fail; review data before running rollback.
    change_column :hospital_directories, :sr_no, :integer, using: 'CAST(sr_no AS SIGNED)'
    change_column :hospital_directories, :number_doctor, :integer, using: 'CAST(number_doctor AS SIGNED)'
    change_column :hospital_directories, :num_mediconsultant_or_expert, :integer, using: 'CAST(num_mediconsultant_or_expert AS SIGNED)'
    change_column :hospital_directories, :total_num_beds, :integer, using: 'CAST(total_num_beds AS SIGNED)'
    change_column :hospital_directories, :number_private_wards, :integer, using: 'CAST(number_private_wards AS SIGNED)'
    change_column :hospital_directories, :num_bed_for_eco_weaker_sec, :integer, using: 'CAST(num_bed_for_eco_weaker_sec AS SIGNED)'
    change_column :hospital_directories, :state_id, :integer, using: 'CAST(state_id AS SIGNED)'
    change_column :hospital_directories, :district_id, :integer, using: 'CAST(district_id AS SIGNED)'
  end
end
