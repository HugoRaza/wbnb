class PagesController < ApplicationController
  def home
    @vehicles = Vehicle.joins(:rentals).joins(:vehicle_reviews).where("vehicle_reviews.rating >= 4").distinct
  end
end
