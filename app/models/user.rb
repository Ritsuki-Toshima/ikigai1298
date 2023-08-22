class User < ApplicationRecord
  has_many :supports_as_elderly, class_name: "Support", foreign_key: :elderly_id
  has_many :supports_as_trusted_user, class_name: "Support", foreign_key: :trusted_user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
