class HealthRecordsController < ApplicationController
  def index
    @health_records = policy_scope(HealthRecord).where(user: current_user)
  end

  def show
    @health_record = HealthRecord.find(:id)
    authorize @health_record
  end

  def new
    @health_record = HealthRecord.new
    authorize @health_record
  end

  def create
    @health_record = HealthRecord.new(health_record_params)
    @health_record.user_id = current_user.id
    health_data = GoogleVisionService.new("https://www.citizen-systems.com/fileadmin/images/healthcare/category/Wrist_Blood_Pressure_Monitor.jpg").call
    @health_record.sys = health_data[0]
    @health_record.dia = health_data[1]
    @health_record.pulse = health_data[2]
    authorize @health_record
    if @health_record.save
      redirect_to health_records_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def health_record_params
    params.require(:health_record).permit(:mood_status, :weight, :sys, :dia, :pulse, :photo)
  end
end
