class Medicine < ApplicationRecord
  belongs_to :user
  has_many :reminders
end
