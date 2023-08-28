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
    @notification = Notification.new
    authorize @notification
    if @notification.save
      NotificationChannel.broadcast_to(
        @current_user,
        render_to_string(partial: "notification", locals: { notification: @notification })
      )
      head :ok
    else
      render :new, status: :unprocessable_entity
    end
  end
end
