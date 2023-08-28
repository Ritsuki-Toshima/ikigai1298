class HealthRecordsController < ApplicationController
  def index
    @health_records = policy_scope(HealthRecord).where(user: current_user)
  end

  def show
    @health_record = HealthRecord.find(params[:id])
    authorize @health_record
  end

  def new
    @support = Support.find(params[:support_id])
    @health_record = HealthRecord.new
    authorize @health_record
  end

  def create
    @support = Support.find(params[:support_id])
    @health_record = HealthRecord.new(health_record_params)
    @health_record.user = User.find(@support.elderly_id)
    @trusted_user = User.find(@support.trusted_user_id)
    authorize @health_record
    if @health_record.save
      redirect_to support_health_records_path(@support)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def health_record_params
    params.require(:health_record).permit(:mood_status, :weight, :sys, :dia, :pulse)
  end
end
