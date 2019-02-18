class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :vehicle_reviews, through: :rentals

  validates :name, presence: true
  validates :category, presence: true
                       # inclusion: { in: %i[bike wheelbarrow scooter skateboard animal roller fantasy other] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
end
