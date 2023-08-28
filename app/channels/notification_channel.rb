class NotificationChannel < Noticed::NotificationChannel
  def subscribed
    # stream_from "some_channel"
    stream_from  current_user #  "notification_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
