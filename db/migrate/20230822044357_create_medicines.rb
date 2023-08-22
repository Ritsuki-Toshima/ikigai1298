class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :description
      t.integer :dosage
      t.integer :dosage_remaining
      t.string :unit
      t.datetime :start_date
      t.datetime :end_date
      t.string :frequency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
