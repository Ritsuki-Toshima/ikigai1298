class CreateHealthRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :health_records do |t|
      t.integer :mood_status
      t.integer :weight
      t.integer :sys
      t.integer :dia
      t.integer :pulse
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
