class RentalsController < ApplicationController
  def create
  end

  def index
  end

  def show
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.status = params[:status]
    if @rental.save
      redirect_to owner_dashboard_path
    else
      redirect_to vehicles_path
    end
  end
end
