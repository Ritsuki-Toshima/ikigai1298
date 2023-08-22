class AddFirstNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :height, :integer
    add_column :users, :latitude, :float
    add_column :users, :longtitude, :float
  end
end
