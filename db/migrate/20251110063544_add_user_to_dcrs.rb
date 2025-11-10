class AddUserToDcrs < ActiveRecord::Migration[7.2]
  def change
    add_reference :daily_collect_reports, :user, null: false, foreign_key: true
  end
end
