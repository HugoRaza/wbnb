class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.vehicle = Vehicle.find(params[:vehicle_id])
    @rental.total_price = (@rental.end_date - @rental.start_date + 1) * @rental.vehicle.price
    if @rental.save
      redirect_to rentals_path
    else
      redirect_to vehicle_path(@rental.vehicle), notice: "Please fill the fields correctly"
    end
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

  def destroy
    @rental = Rental.find(params[:id])
    if @rental.destroy
      message = "You justed canceled your rental"
    else
      message = "You can't cancel this rental"
    end
    redirect_to rentals_path, notice: message
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :message)
  end
end
