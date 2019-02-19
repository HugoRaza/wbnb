class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :category, :description, :price, :location, :image)
  end
end
