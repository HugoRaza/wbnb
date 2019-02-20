class UsersController < ApplicationController
  before_action :set_user, only: [:owner_dashboard, :my_profile, :edit, :update]

  def owner_dashboard
  end

  def show
    @user = User.find(params[:id])
  end

  def my_profile
    render :show
  end

  def edit
  end

  def update
    @user.email = params[:user][:email]
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.profile_picture = params[:user][:profile_picture]
    @user.save
    redirect_to my_profile_path
  end


  private

  def set_user
    @user = current_user
  end
end
