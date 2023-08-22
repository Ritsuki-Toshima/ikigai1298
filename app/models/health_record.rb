class HealthRecord < ApplicationRecord
  belongs_to :user
  validates :mood_status, :weight, :sys, :dia, :pulse, presence: true
end
