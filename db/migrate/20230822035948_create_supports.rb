class CreateSupports < ActiveRecord::Migration[7.0]
  def change
    create_table :supports do |t|
      t.references :elderly, foreign_key: { to_table: :users }
      t.references :trusted_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
