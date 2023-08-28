class NotificationChannel < Noticed::NotificationChannel
  def subscribed
    # stream_from "some_channel"
    stream_for current_user #    "notification" current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify(data)
    ActionCable.server.broadcast current_user, data
  end
end
