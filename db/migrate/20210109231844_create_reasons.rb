class CreateReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :reasons do |t|
      t.string :reason

      t.timestamps
    end
  end
end
