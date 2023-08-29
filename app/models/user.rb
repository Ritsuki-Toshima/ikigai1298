require 'date'

class User < ApplicationRecord
  include CableReady::Broadcaster
  has_many :supports_as_elderly, class_name: "Support", foreign_key: :elderly_id
  has_many :trusted_users, through: :supports_as_elderly, class_name: "User", foreign_key: :elderly_id
  has_many :supports_as_trusted_user, class_name: "Support", foreign_key: :trusted_user_id
  has_many :elderlies, through: :supports_as_trusted_user, class_name: "User", foreign_key: :trusted_user_id
  has_many :medicines, dependent: :destroy
  has_many :reminders, through: :medicines
  has_many :appointments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :health_records, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validates :email, :first_name, :last_name, :gender, :address, :phone_number, presence: true
  # validates :gender, presence: true, inclusion: { in: ["M", "F"] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # after_create_commit :send_comment_notification

  after_create do
    cable_ready["visitors"].console_log(message: "Welcome to the site!")
    cable_ready.broadcast # send queued console_log operation to all ExampleChannel subscribers
  end

  def elderly?
    if self.trusted_users != []
      true
    else
      false
    end
  end

  def age
    today = Date.today
    age = today.year - self.birth_date.year - (today.strftime('%m%d') < self.birth_date.strftime('%m%d') ? 1 : 0)
    age
  end

  private

  # def send_comment_notification
  #   ActionCable.server.broadcast("notification_channel", {
  #     title: self.title,
  #     body: self.body
  #   })
    # how to process JSON - ActionCable.render
    # @user = current_user
    # @notification = CommentNotification.with(comment: @comment)
    # CommentNotification.with(post: @post).deliver(@user)
  # end
end
