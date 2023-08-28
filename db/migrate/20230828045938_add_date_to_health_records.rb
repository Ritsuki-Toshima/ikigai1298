class AddDateToHealthRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :health_records, :date, :date
  end
end
