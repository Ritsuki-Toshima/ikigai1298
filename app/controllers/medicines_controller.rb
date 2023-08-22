class MedicinesController < ApplicationController
  def index
    @medicine = Medicine.all
  end

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    @medicine.user = current_user
    if @medicine.save
      redirect_to
    else
      render :new, status: :unprocessable_entity
    end
  end

  def medicine_params
    params.require(:medicine).permit(:name, :description, :dosage, :dosage_remaining, :unit, :start_date, :end_date, :frequency)
  end
end
