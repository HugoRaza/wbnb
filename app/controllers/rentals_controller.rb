class RentalsController < ApplicationController
  def create
  end

  def index
    @rentals = Rental.where(user: current_user)
  end

  def show
    @rental = Rental.where(user: current_user).find(params[:id])
    @vehicle_review = VehicleReview.new
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.status = params[:status]
    if @rental.save
      message = "Your reservation has been #{params[:status]} successfully"
    else
      message = "Error, stop hacking my website!"
    end
    redirect_to owner_dashboard_path, notice: message
  end
end
