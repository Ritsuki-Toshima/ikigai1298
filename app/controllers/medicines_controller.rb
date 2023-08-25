class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:edit, :update]

  def index
    @medicines = policy_scope(Medicine).all
  end

  def new
    @support = Support.find(params[:support_id])
    @medicine = Medicine.new
    authorize @medicine
  end

  def create
    @support = Support.find(params[:support_id])
    @medicine = Medicine.new(medicine_params)
    @medicine.user = User.find(@support.elderly_id)
    @trusted_user = User.find(@support.trusted_user_id)
    authorize @medicine
    if @medicine.save
      redirect_to support_path(@support)
      SendSmsService.new(@medicine.user, "Dear #{@medicine.user.first_name.capitalize}, please check the Ikigai App - #{@trusted_user.first_name.capitalize} added a new medicine for you").call
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @medicine.update
      redirect_to medicines_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_medicine
    @medicine = Medicine.find(params[:id])
    authorize @medicine
  end

  def medicine_params
    params.require(:medicine).permit(:name, :description, :dosage, :dosage_remaining, :unit, :start_date, :end_date, :frequency, :photo)
  end
end
