class CreateDailyCollectReports < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_collect_reports do |t|
      t.string :hospital_name, null: false
      t.string :doctor_name, null: false
      t.string :sample_product_name, null: false
      t.integer :quantity_distributed, null: false
      t.date :report_date, null: false
      t.timestamps
    end
  end
end
