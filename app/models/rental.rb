class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :vehicle_review, dependent: :destroy

end
