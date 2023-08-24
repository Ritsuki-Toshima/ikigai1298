class Appointment < ApplicationRecord
  belongs_to :user
  validates :name, :description, :start_time, :end_time, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
