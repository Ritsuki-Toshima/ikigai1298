class UsersController < ApplicationController
  def overview
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :elderly)
  end
end
