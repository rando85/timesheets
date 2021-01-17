class ChangeHoursToBeDecimalInWeeklyHours < ActiveRecord::Migration[6.1]
  def change
    change_column :weekly_hours, :hours, :decimal
  end
end
