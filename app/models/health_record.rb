class HealthRecord < ApplicationRecord
  belongs_to :user
  validates :mood_status, :weight, :sys, :dia, :pulse, presence: true
  has_one_attached :photo
end
