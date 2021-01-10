class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :week, null: false, foreign_key: true
      t.references :month, null: false, foreign_key: true
      t.string :date_str
      t.date :date

      t.timestamps
    end
  end
end
