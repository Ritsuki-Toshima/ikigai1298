class RemindersController < ApplicationController
  before_action :set_reminder, only: [:edit, :update]
  def new
    @medicine = Medicine.find(params[:medicine_id])
    @reminder = Reminder.new
    authorize @reminder
  end

  def create
    @medicine = Medicine.find(params[:medicine_id])
    @reminder = Reminder.new(reminder_params)
    authorize @reminder
    if @reminder.save
      redirect_to medicine_path(@medicine)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reminder.update
      redirect_to medicine_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
    authorize @reminder
  end

  def reminder_params
    params.require(:reminder).permit(:dosage, :time_to_taken)
  end
end
