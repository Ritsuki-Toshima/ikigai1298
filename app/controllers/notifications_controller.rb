class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).all
    @notifications = current_user.notifications
  end
end
