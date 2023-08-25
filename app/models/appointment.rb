class Appointment < ApplicationRecord
  belongs_to :user
  validates :name, :description, :start_time, :end_time, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :active, -> { where('start_time >= ? AND end_time <= ?', Date.today.to_datetime, (Date.today + 1).to_datetime) }

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
end
