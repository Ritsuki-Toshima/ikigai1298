class Medicine < ApplicationRecord
  enum status: { pending: "pending", taken: "taken", lost: "lost" }

  belongs_to :user
  has_many :reminders, dependent: :destroy
  has_one_attached :photo

  validates :name, :start_date, presence: true
end
