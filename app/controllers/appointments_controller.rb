class AppointmentsController < ApplicationController
  before_action :set_medicine, only: [:edit, :update]

  def index
    @application = policy_scope(Application).all
  end

  def new
    @application = Application.new
    authroize @application
  end

  def create
    @support = Support.find(params[:support_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    authorize @application
    if @appointment.save
      redirect_to support_path(@support)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:name, :description, :start_time, :end_time, :address)
  end
end
