# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Removing Old Users..."
Review.destroy_all
Reservation.destroy_all
Planet.destroy_all
User.destroy_all

puts "Creating New Users..."

10.times do
  user = User.new(
    name: Faker::Esport.player,
    email: Faker::Internet.email,
    password: "password"
  )
  user.save!
  planet = Planet.new(
    name: Faker::Space.planet,
    location: Faker::TvShows::StarTrek.location,
    # photos_url: "https://picsum.photos/200/300",
    price_per_night: rand(1..999_999),
    maximum_guests: rand(1..999_999_999),
    description: Faker::Lorem.paragraphs.join("\n"),
    rotation_time: "#{rand(1..999)} days",
    revolution_time: "#{rand(1..999)} days",
    radius: "#{rand(1000..999_999)} Kilometers",
    avg_temp: "#{rand(-500..500)} Celsius"
  )
  planet.user = user
  planet.save!

  review = Review.new(rating: 3, content: "Too hot", user: user)
  review.planet = planet
  review.save!
end

puts "#{User.count} Users created"



# puts "Removing Old Planets..."
# Planet.destroy_all

# puts "Creating New Planets..."

# 15.times do
#   Planet.create!(
#     name: Faker::Space.planet,
#     location: Faker::TvShows::StarTrek.location,
#     # photos_url: "https://picsum.photos/200/300",
#     price_per_night: rand(1..999_999),
#     maximum_guests: rand(1..999_999_999),
#     description: Faker::Emotion.noun,
#     rotation_time: "#{rand(1..999)} days",
#     revolution_time: "#{rand(1..999)} days",
#     radius: "#{rand(1000..999_999)} Kilometers",
#     avg_temp: "#{rand(-500..500)} Celsius"
#   )
# end

puts "#{Planet.count} Planets created."
puts "#{Review.count} Reviews created."
