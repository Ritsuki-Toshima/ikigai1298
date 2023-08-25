class Support < ApplicationRecord
  belongs_to :elderly, class_name: "User"
  belongs_to :trusted_user, class_name: "User"
  has_one_attached :photo
end
