class VehicleReview < ApplicationRecord
  belongs_to :rental
  validates :rating, presence: true
end
