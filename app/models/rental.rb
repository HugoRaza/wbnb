class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_one :vehicle_review, dependent: :destroy

  validate :user_rental_rule
  validate :date_rule
  validates :status, inclusion: { in: %w[pending accepted declined] }

  private

  # the client is not renting his own vehicle
  def user_rental_rule
    errors.add(:user_id, "You cannot rent your own vehicle") if user_id == vehicle.user_id
  end

  def date_rule
    errors.add(:end_date, "End date must be greater than start date") if end_date < start_date
  end
end
