class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :vehicle_review, dependent: :destroy

  validate :custom_rule

  private
  
  # the client is not renting his own vehicle
  def custom_rule
    if user_id == vehicle.user_id
      errors.add(:user_id, "You cannot rent your own vehicle")
    end
  end
end
