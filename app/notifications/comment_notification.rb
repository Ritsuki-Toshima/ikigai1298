# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver_later(User.all)
CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database, debug: true
  deliver_by :action_cable, debug: true  # format: :to_action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :post

  # Define helper methods to make rendering easier.
  #
  def to_database
    {
    type: self.class.name,
    params: params,
    account: Current.account,
    }
  end

  # def to_action_cable
  #   {

  #   }
  # end

  def message
    t(".message")
  end

  def url
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    post_path(params[:post])
  end
end
