class Medicine < ApplicationRecord
  enum status: { pending: "pending", taken: "taken", lost: "lost" }

  belongs_to :user
  has_many :reminders, dependent: :destroy
  has_one_attached :photo

  validates :name, :description, :dosage, :unit, :start_date, :end_date, :frequency, presence: true
end
