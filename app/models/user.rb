class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :profile_picture, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vehicles, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :vehicle_rentals, through: :vehicles, source: :rentals
end
