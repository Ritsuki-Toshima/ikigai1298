class AppointmentsController < ApplicationController
  before_action :set_medicine, only: [:edit, :update]

  def index
    @appointments = policy_scope(Appointment).all
    # @support = Support.find(params[:support_id])
    # @appointments = @support.elderly.appointments
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @marker = {
        lat: @appointment.latitude,
        lng: @appointment.longitude,
        marker_html: render_to_string(partial: "marker")
      }
  end

  def new
    @support = Support.find(params[:support_id])
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @support = Support.find(params[:support_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user = User.find(@support.elderly_id)
    @trusted_user = User.find(@support.trusted_user_id)
    @appointment.end_time = @appointment.start_time + 1.hour
    authorize @appointment
    if @appointment.save
      redirect_to support_path(@support)
      SendSmsService.new(@appointment.user, "Dear #{@appointment.user.first_name.capitalize}, #{@trusted_user.first_name.capitalize} added a new appointment for you on #{@appointment.start_time.strftime('%A, %b %d')} at #{@appointment.start_time.strftime('%l:%M %p')}. Check out the Ikigai app at: https://www.ikigai.bond").call
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def appointment_params
    params.require(:appointment).permit(:name, :description, :start_time, :end_time, :address)
  end
end
