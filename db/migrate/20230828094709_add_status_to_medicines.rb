class AddStatusToMedicines < ActiveRecord::Migration[7.0]
  def change
    add_column :medicines, :status, :string, default: "pending"
  end
end
