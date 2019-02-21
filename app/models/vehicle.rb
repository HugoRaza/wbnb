class Vehicle < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :vehicle_reviews, through: :rentals

  validates :name, presence: true
  validates :category, presence: true,
                       inclusion: { in: %w[bike wheelbarrow scooter skateboard animal roller fantasy other] }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  validates :image, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
