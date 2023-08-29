class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).all
    @notifications = current_user.notifications
  end

  def new
    @notification = Notification.new
    @notifications = Notification.all
    authorize @notification
  end

  def create
    @notifications = policy_scope(Notification).all
    NotificationChannel.broadcast_to(current_user, title: 'New things!', body: 'All the news fit to print')
  end
end
