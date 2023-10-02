class AddElderlyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :elderly, :boolean, default: false, null: false
  end
end
