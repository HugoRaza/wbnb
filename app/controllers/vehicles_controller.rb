class VehiclesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def index
    @vehicles = Vehicle.all
  end
end
