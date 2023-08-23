class AppointmentsController < ApplicationController
  before_action :set_medicine, only: [:edit, :update]

  def index
    @appointments = policy_scope(Appointment).all
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude
      }
    end
  end

  def new
    @support = Support.find(params[:support_id])
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @support = Support.find(params[:support_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    authorize @appointment
    if @appointment.save
      redirect_to support_path(@support)
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
