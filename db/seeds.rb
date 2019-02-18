require 'faker'

def user_for_rental(vehicle)
  id = User.ids.sample(1).first
  # user_for_rental(vehicle) until id != vehicle.user_id
  return id
end

puts 'Cleaning database...'
VehicleReview.destroy_all
Rental.destroy_all
Vehicle.destroy_all
User.destroy_all

puts 'Creating 5 fake users...'
user_attributes = []
id = 1
5.times do
  user_attributes << {
    email: Faker::Internet.email,
    password: "azertyuiop",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    profile_picture: "https://thispersondoesnotexist.com?id=#{id}"
  }
  id += 1
end

User.create!(user_attributes)
puts 'Users created'

puts 'Creating 3 vehicles per user'
vehicle_attributes = []

id = 1
User.all.each do |user|
  3.times do
  vehicle_attributes << {
    name: Faker::Vehicle.manufacture,
    category: "bike",
    description: Faker::ChuckNorris.fact,
    image: "https://loremflickr.com/320/240/vehicle?id=#{id}",
    price: rand(1..100),
    location: Faker::Address.city,
    user_id: user.id
  }
  id += 1
  end
end
Vehicle.create!(vehicle_attributes)
puts "Vehicles created"

puts "Creating 2 rental per vehicle"
rental_attr = []
user_ids = User.ids
Vehicle.all.each do |vehicle|
  rental_attr << {
    start_date: "2019-#{rand(1..6)}-#{rand(1..28)}",
    end_date: "2019-#{rand(7..12)}-#{rand(1..28)}",
    message: Faker::ChuckNorris.fact,
    total_price: rand(1..1000),
    user_id: user_for_rental(vehicle),
    vehicle_id: vehicle.id
  }
end

Rental.create!(rental_attr)
puts "Rentals created"

puts "Creating 1 review per rental"
review_attr = []
Rental.all.each do |rental|
  review_attr << {
    description: Faker::ChuckNorris.fact,
    rating: rand(0..5),
    rental_id: rental.id
  } if rental.id.even?
end

VehicleReview.create!(review_attr)
puts "Reviews created"

puts 'Finished!'
