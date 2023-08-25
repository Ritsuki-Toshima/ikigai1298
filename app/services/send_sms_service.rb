require 'twilio-ruby'

class SendSmsService
  def initialize(user, message)
    @user = user
    @message = message
    # probably pass in the user as well so you can get the phone number?
  end

  def call
    client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    client.messages.create(
      from: ENV['TWILIO_NUMBER'], # Your Twilio number
      to: user.phone_number, # User mobile phone number
      body: message
    )
  end
end

# you could use this a controller or anywhere
SendSmsService.new(instance_of_a_user, 'hello').call
