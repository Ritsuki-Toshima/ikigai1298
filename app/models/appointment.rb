class Appointment < ApplicationRecord
  belongs_to :user
  validates :name, :description, :start_time, :end_time, :address, presence: true
end
