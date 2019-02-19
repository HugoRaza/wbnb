class UsersController < ApplicationController
  before_action :set_user

  def owner_dashboard
  end

  private

  def set_user
    @user = current_user
  end
end
