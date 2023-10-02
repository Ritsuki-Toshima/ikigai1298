class ChangeElderlyInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :elderly, :boolean, null: false
  end
end
