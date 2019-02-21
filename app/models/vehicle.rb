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

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # search by name, category and description in HomePage
  include PgSearch
  pg_search_scope :search_by_name_category_description_and_location,
    against: [:name, :category, :description, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
