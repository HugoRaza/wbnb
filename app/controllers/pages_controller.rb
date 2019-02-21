class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # top5 vehicles with best average rating
    @vehicles = Vehicle.select('vehicles.*, avg(vehicle_reviews.rating) as average').joins(:rentals).joins(:vehicle_reviews).group('vehicles.id').order('average desc').limit(8)
  end
end
