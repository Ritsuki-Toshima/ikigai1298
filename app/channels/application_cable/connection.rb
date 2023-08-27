module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      user_id = cookies.encrypted[:user_id]
      return reject_unauthorized_connection if user_id.nil?
      user = User.find_by(id: user_id)
      return reject_unauthorized_connection if user.nil?
      self.current_user = user
    end

    protected

    def find_verified_user
      if (current_user = env["warden"].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
