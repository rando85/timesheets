class AddSlugToConsultants < ActiveRecord::Migration[6.1]
  def change
    add_column :consultants, :slug, :string
    add_index :consultants, :slug, unique: true
  end
end
