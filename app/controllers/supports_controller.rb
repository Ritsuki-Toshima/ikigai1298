class SupportsController < ApplicationController
  def index
    @users = User.all
    @active_appointments = current_user.appointments.active
    # @elderlies = current_user.elderlies
    # @trusted_users = current_user.supports_as_trusted_user
    @supports = policy_scope(Support).where(trusted_user: current_user)
  end

  def show
    # These lines are for displaying calendar
    # -----------------------------------------------------------------------------------------------------------
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = Appointment.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    # -----------------------------------------------------------------------------------------------------------
    @support = current_user.supports_as_trusted_user.find(params[:id])
    authorize @support
    @appointments = Appointment.where(user_id: @support.elderly_id)
    authorize @appointments
    @appointment = @appointments.first
    authorize @appointment
    if @appointments.length == 1
      @marker = {
        lat: @appointment.latitude,
        lng: @appointment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    elsif @appointments.length > 1
      @markers = @appointments.geocoded.map do |appointment|
        {
        lat: appointment.latitude,
        lng: appointment.longitude,
        marker_html: render_to_string(partial: "marker")
        }
      end
    end
  end
end
