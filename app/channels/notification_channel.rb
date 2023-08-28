class NotificationChannel < Noticed::NotificationChannel
  def subscribed
    # stream_from "some_channel"
    stream_for current_user #    "notification" current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
