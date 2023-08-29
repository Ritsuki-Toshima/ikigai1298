class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    puts "Hello World"
    NotificationChannel.broadcast_to(
      current_user,
      title: 'New things!',
      body: 'All the news fit to print'
    )
  end
end
