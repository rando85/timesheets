class CreateDailyHours < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_hours do |t|
      t.integer :hours
      t.text :issue
      t.references :day, null: false, foreign_key: true
      t.references :consultant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
