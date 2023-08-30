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
    @health_record.date = Date.today

  authorize @health_record
  if @health_record.save
    health_data = GoogleVisionService.new(@health_record.photo.url).call
    @health_record.sys = health_data[0]
    @health_record.dia = health_data[1]
    @health_record.pulse = health_data[2]
    @health_record.save
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
