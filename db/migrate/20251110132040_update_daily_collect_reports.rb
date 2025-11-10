class UpdateDailyCollectReports < ActiveRecord::Migration[7.0]
  def change
    # Make hospital_name optional
    change_column_null :daily_collect_reports, :hospital_name, true

    # Add doctor_department column
    add_column :daily_collect_reports, :doctor_department, :string

    # Rename quantity_distributed to billing_order_quantity
    rename_column :daily_collect_reports, :quantity_distributed, :billing_order_quantity

    # Add sample_product_quantity column
    add_column :daily_collect_reports, :sample_product_quantity, :integer
  end
end
