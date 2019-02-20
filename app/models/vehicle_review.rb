class VehicleReview < ApplicationRecord
  belongs_to :rental
  validates :rating, presence: true
  validates :rental_id, uniqueness: true
end
