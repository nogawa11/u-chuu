require "json"

filepath = "../db/data.json"
serialized_data = File.read(__dir__ + "/data.json")
data = JSON.parse(serialized_data)


puts "Removing Old Users..."
Review.destroy_all
Reservation.destroy_all
Planet.destroy_all
User.destroy_all

puts "Creating New Users..."

# 10.times do
#   user = User.new(
#     name: Faker::Esport.player,
#     email: Faker::Internet.email,
#     password: "password"
#   )
#   user.save!
#   planet = Planet.new(
#     name: Faker::Space.planet,
#     location: Faker::TvShows::StarTrek.location,
#     # photos_url: "https://picsum.photos/200/300",
#     price_per_night: rand(1..999_999),
#     maximum_guests: rand(1..999_999_999),
#     description: Faker::Lorem.paragraphs.join("\n"),
#     rotation_time: "#{rand(1..999)} days",
#     revolution_time: "#{rand(1..999)} days",
#     radius: "#{rand(1000..999_999)} Kilometers",
#     avg_temp: "#{rand(-500..500)} Celsius"
#   )
#   planet.user = user
#   planet.save!
# end

data.each do |planet|
  new_planet = Planet.new(
    name: planet["name"],
    location: "Milky Way",
    price_per_night: rand(1..999_999),
    maximum_guests: rand(1..999_999_999),
    description: planet["overview"]["content"],
    rotation_time: planet["rotation"],
    revolution_time: planet["revolution"],
    radius: planet["radius"],
    avg_temp: planet["temperature"],
    
  )

  user = User.new(
    name: Faker::Esport.player,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!

  new_planet.user = user
  new_planet.save!
end

25.times do
  review = Review.new(
    rating: rand(0..5),
    content: Faker::Hipster.paragraph(sentence_count: 2),
    user: User.all.sample
  )
  review.planet = Planet.all.sample
  review.save!
end

10.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Faker::Date.forward(days: rand(1..30)),
    end_date: Faker::Date.forward(days: rand(31..90)),
    number_of_guests: rand(1..999_999),
    planet: Planet.all.sample,
    user: User.all.sample
  )
  reservation.save!
end

puts "#{User.count} Users created"
puts "#{Planet.count} Planets created."
puts "#{Review.count} Reviews created."
puts "#{Reservation.count} Reservations created."
