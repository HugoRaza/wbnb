class VehicleReviewsController < ApplicationController
  def create
    @rental = Rental.where(user: current_user).find(params[:rental_id])
    @vehicle_review = VehicleReview.new(vehicle_review_params)
    @vehicle_review.rental = @rental
    @vehicle_review.save
    redirect_to vehicle_path(@rental.vehicle)
  end

  private

  def vehicle_review_params
    params.require(:vehicle_review).permit(:rating, :description)
  end
end
