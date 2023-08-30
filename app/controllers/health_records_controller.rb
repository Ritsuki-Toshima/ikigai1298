class HealthRecordsController < ApplicationController
  def index
    if params[:user_id].nil?
      @health_records = policy_scope(HealthRecord).where(user_id: current_user.id)
    else
      @health_records = policy_scope(HealthRecord).where(user_id: params[:user_id])
    end
  end

  def show
    @health_record = @health_records.last
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
    @support = Support.where(elderly_id: current_user.id).first
    @trusted_user = User.find(@support.trusted_user_id)
    if @health_record.save
      health_data = GoogleVisionService.new(@health_record.photo.url).call
      @health_record.sys = health_data[0]
      @health_record.dia = health_data[1]
      @health_record.pulse = health_data[2]
      @health_record.save
      redirect_to health_records_path
      if @health_record.mood_status > 3
        SendSmsService.new(@trusted_user, "Dear #{@trusted_user.first_name.capitalize}, #{current_user.first_name.capitalize} updated their health records, but is not feeling great today. Check out the Ikigai app at: https://ikigai1298-c2bc721aa13b.herokuapp.com").call
      else
        SendSmsService.new(@trusted_user, "Dear #{@trusted_user.first_name.capitalize}, #{current_user.first_name.capitalize} updated their health records. Check out the Ikigai app at: https://ikigai1298-c2bc721aa13b.herokuapp.com").call
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def health_record_params
    params.require(:health_record).permit(:mood_status, :weight, :sys, :dia, :pulse, :photo)
  end
end
