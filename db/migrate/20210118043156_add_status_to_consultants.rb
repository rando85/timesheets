class AddStatusToConsultants < ActiveRecord::Migration[6.1]
  def change
    add_column :consultants, :is_active, :integer, default: 1
  end
end
