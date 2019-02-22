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

  def edit
    @vehicle = Vehicle.where(user: current_user).find(params[:id])
  end

  def update
    @vehicle = Vehicle.where(user: current_user).find(params[:id])
    @vehicle.update(vehicle_params)
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
    @rental = Rental.new
  end

  def index
    if params[:term].present?
      @vehicles = Vehicle.search_by_name_category_description_and_location(params[:term])
    else
      @vehicles = Vehicle.all
    end
    @vehicles.where.not(latitude: nil, longitude: nil)
    @markers = @vehicles.map do |vehicle|
      {
        lng: vehicle.longitude,
        lat: vehicle.latitude,
        infoWindow: render_to_string(partial: "info_window", locals: { vehicle: vehicle })
      }
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :category, :description, :price, :location, :image, :term)
  end
end
