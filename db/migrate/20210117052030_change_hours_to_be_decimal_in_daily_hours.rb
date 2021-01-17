class ChangeHoursToBeDecimalInDailyHours < ActiveRecord::Migration[6.1]
  def change
    change_column :daily_hours, :hours, :decimal
  end
end
