require 'twilio-ruby'


class SendSmsService
  def initialize(user, message)
    @user = user
    @message = message
    # probably pass in the user as well so you can get the phone number?
  end

  def call
    client = Twilio::REST::Client.new(ENV.fetch('ACCOUNT_SID', nil), ENV.fetch('AUTH_TOKEN', nil)) # SID & AUTH TOKEN
    client.messages.create(
      from: ENV.fetch('TWILIO_NUMBER', nil), # Your Twilio number
      to:  @user.phone_number, # User mobile phone number
      body: @message
    )
  end
end

# you could use this a controller or anywhere =>
# SendSmsService.new(instance_of_a_user, 'insert message here').call
