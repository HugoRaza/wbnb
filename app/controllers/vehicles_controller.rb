class VehiclesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    # @user = User.find[params[:user_id]]
  end

  def index
    @vehicles = Vehicle.all
  end
end
