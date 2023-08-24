class Medicine < ApplicationRecord
  belongs_to :user
  has_many :reminders, dependent: :destroy
  has_one_attached :photo

  validates :name, :description, :dosage, :unit, :start_date, :end_date, :frequency, presence: true
end
