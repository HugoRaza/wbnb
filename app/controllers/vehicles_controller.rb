class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to owner_dashboard_path
    else
      render :new
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to owner_dashboard_path
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def index
    @vehicles = Vehicle.all
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :category, :description, :price, :location, :image)
  end
end
