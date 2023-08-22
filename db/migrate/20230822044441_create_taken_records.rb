class CreateTakenRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.references :medicine, null: false, foreign_key: true
      t.datetime :time_to_taken
      t.integer :dosage
      t.boolean :taken, default: false
      t.timestamps
    end
  end
end
