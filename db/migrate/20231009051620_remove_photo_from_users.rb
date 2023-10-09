class RemovePhotoFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :photo, :binary
  end
end
