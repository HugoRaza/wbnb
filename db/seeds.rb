require 'faker'

def user_for_rental(vehicle)
  id = User.ids.sample
    if id == vehicle.user_id
      user_for_rental(vehicle)
    else
      return id
    end
end

puts 'Cleaning database...'
User.destroy_all
# Vehicle.destroy_all
# Rental.destroy_all
# VehicleReview.destroy_all

puts 'Creating 5 fake users...'
user_attributes = []
user_attributes << {
  email: "papadetoto@mail.com",
  password: "azertyuiop",
  first_name: "papa",
  last_name: "de Toto",
  remote_profile_picture_url: "https://previews.123rf.com/images/rastudio/rastudio1608/rastudio160802655/61782015-young-man-pushing-wheelbarrow-with-plant-and-dirt-in-the-park-a-gardener-with-wheelbarrow-on-a-backg.jpg"
}
user_attributes << {
  email: "cousinedetoto@mail.com",
  password: "azertyuiop",
  first_name: "cousin ",
  last_name: "de Toto",
  remote_profile_picture_url: "https://comps.canstockphoto.com/man-with-plant-and-wheelbarrow-image_csp38765975.jpg"
}
user_attributes << {
  email: "toto@mail.com",
  password: "azertyuiop",
  first_name: "toto",
  last_name: "Luimaim",
  remote_profile_picture_url: "https://image.shutterstock.com/image-vector/caucasian-gardener-wheelbarrow-standing-on-450w-696109057.jpg"
}
user_attributes << {
  email: "biquettedetoto@mail.com",
  password: "azertyuiop",
  first_name: "biquette",
  last_name: "de Toto",
  remote_profile_picture_url: "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX24489376.jpg"
}
user_attributes << {
  email: "totocompany@mail.com",
  password: "azertyuiop",
  first_name: "Toto",
  last_name: "Company",
  remote_profile_picture_url: "https://previews.123rf.com/images/rastudio/rastudio1603/rastudio160306207/54048224-an-asian-man-standing-with-a-plant-and-soil-in-a-wheelbarrow-on-a-background-with-solar-panels-vecto.jpg"
}

User.create!(user_attributes)
puts 'Users created'

puts 'Creating 2 vehicles per user'
id = User.first.id
vehicle_attributes = []
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://i.ytimg.com/vi/G_5eqRUDCmM/hqdefault.jpg",
  price: rand(1..100),
  location: "Lyon",
  user_id: id
}
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://i.pinimg.com/originals/63/05/12/630512ee27205f5a0bb57c16f0f3718f.jpg",
  price: rand(1..100),
  location: "Clermont-Ferrand",
  user_id: id
}
id += 1
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://www.coolpun.com/images/coolpun/fe/fe2d61f8cd1d882787218e3b41877701.jpeg",
  price: rand(1..100),
  location: "Paris",
  user_id: id
}
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://i.pinimg.com/originals/da/96/13/da9613e46ff7c03eaf20944a99d8ba42.jpg",
  price: rand(1..100),
  location: "Marseille",
  user_id: id
}
id += 1
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "http://photos.hamariweb.com/photos/Funny-Labour-Trolly-14079.jpg",
  price: rand(1..100),
  location: "Saint Etienne",
  user_id: id
}
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://vignette.wikia.nocookie.net/tales-of-athlin/images/e/e0/Funny-wheelbarrow-bench-design.jpg/revision/latest?cb=20131021190601",
  price: rand(1..100),
  location: "Riom",
  user_id: id
}
id += 1
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://www.gardenlines.co.uk/sites/default/files/sherpa_powered_barrow1.jpg",
  price: rand(1..100),
  location: "Versailles",
  user_id: id
}
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNdMtf1hGSss87AEqnbg-O6U07PfXk53KF6i3LO4nto6ffhMQX",
  price: rand(1..100),
  location: "Toulouse",
  user_id: id
}
id += 1
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "http://lepassetempsderose.l.e.pic.centerblog.net/o/59e111ba.jpg",
  price: rand(1..100),
  location: "Rouen",
  user_id: id
}
vehicle_attributes << {
  name: "#{Faker::Hacker.adjective} Wheelbarrow",
  category: "wheelbarrow",
  description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  remote_image_url: "http://1.bp.blogspot.com/-HM1C07rz7cs/Vd3DqHFvWiI/AAAAAAAAGJA/k0TkErd4w6g/s1600/wheelbarrowGiantWedgefield.jpg",
  price: rand(1..100),
  location: "Nantes",
  user_id: id
}
Vehicle.create!(vehicle_attributes)
puts "Vehicles created"

puts "Creating 3 rental per vehicle"
rental_attr = []
user_ids = User.ids
Vehicle.all.each do |vehicle|
  rental_attr << {
    start_date: "2019-#{rand(1..6)}-#{rand(1..28)}",
    end_date: "2019-#{rand(7..12)}-#{rand(1..28)}",
    message: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
    total_price: rand(1..1000),
    user_id: user_for_rental(vehicle),
    vehicle_id: vehicle.id
  }
  rental_attr << {
  start_date: "2019-#{rand(1..6)}-#{rand(1..28)}",
  end_date: "2019-#{rand(7..12)}-#{rand(1..28)}",
  message: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  total_price: rand(1..1000),
  user_id: user_for_rental(vehicle),
  vehicle_id: vehicle.id
  }
  rental_attr << {
  start_date: "2019-#{rand(1..6)}-#{rand(1..28)}",
  end_date: "2019-#{rand(7..12)}-#{rand(1..28)}",
  message: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
  total_price: rand(1..1000),
  user_id: user_for_rental(vehicle),
  vehicle_id: vehicle.id
  }
end

Rental.create!(rental_attr)
puts "Rentals created"

puts "Creating review for rental with id even"
review_attr = []
Rental.all.each do |rental|
  review_attr << {
    description: Faker::ChuckNorris.fact.gsub("Chuck Norris", "Wheelbarrow"),
    rating: rand(0..5),
    rental_id: rental.id
  } if rental.id.even?
end

VehicleReview.create!(review_attr)
puts "review created"

puts 'Finished!'
