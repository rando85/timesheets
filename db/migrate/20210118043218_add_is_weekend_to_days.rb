class AddIsWeekendToDays < ActiveRecord::Migration[6.1]
  def change
    add_column :consultants, :is_weekend, :integer, default: 0
  end
end
