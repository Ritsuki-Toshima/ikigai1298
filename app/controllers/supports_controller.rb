class SupportsController < ApplicationController
  def index
    @users = User.all
    # @elderlies = current_user.elderlies
    # @trusted_users = current_user.supports_as_trusted_user
    @supports = policy_scope(Support).where(trusted_user: current_user)
  end

  def show
    @support = current_user.supports_as_trusted_user.find(params[:id])
    authorize @support
    @appointments = Appointment.where(user_id: @support.elderly_id)
    authorize @appointments
    if @appointments.length > 1
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
    elsif @appointments.length == 1
      @markers = {
        lat: @appointment.latitude,
        lng: @appointment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
