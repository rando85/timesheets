class CreateVacations < ActiveRecord::Migration[6.1]
  def change
    create_table :vacations do |t|
      t.references :day, null: false, foreign_key: true
      t.references :consultant, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true

      t.timestamps
    end
  end
end
