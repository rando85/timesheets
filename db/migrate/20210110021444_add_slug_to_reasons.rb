class AddSlugToReasons < ActiveRecord::Migration[6.1]
  def change
    add_column :reasons, :slug, :string
    add_index :reasons, :slug, unique: true
  end
end
