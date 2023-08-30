class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  validates :message, presence: true
end
