class UsersController < ApplicationController
  def overview
  end

  def new
    @user = User.new
    authorize @user
  end

  def show
    @user = current_user
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :elderly, :gender, :address, :phone_number, :birth_date, :height, :latitude, :longtitude, :photo)
  end
end
