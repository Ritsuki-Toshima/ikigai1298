class RemindersController < ApplicationController
  before_action :set_reminder, only: [:edit, :update]
  def index
    @reminders = Reminder.all
  end

  def new
    @medicine = Medicine.find(params[:medicine_id])
    @reminder = Reminder.new
    @reminders = Reminder.where(medicine_id: params[:medicine_id])
    authorize @reminder
  end

  def create
    @medicine = Medicine.find(params[:medicine_id])
    @reminder = Reminder.new(reminder_params)
    @reminder.medicine = @medicine
    authorize @reminder
    if @reminder.save
      redirect_to new_medicine_reminder_path(@medicine), notice: 'Reminder added successfully.'
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
    params.require(:reminder).permit(:time_to_taken)
  end
end
