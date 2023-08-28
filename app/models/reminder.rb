class Reminder < ApplicationRecord
  belongs_to :medicine
  validates :time_to_taken, presence: true
end
