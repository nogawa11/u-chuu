# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Removing Old Planets..."
Planet.destroy_all

puts "Creating New Planets..."

15.times do
  Planet.create!(
    name: Faker::Space.planet,
    location: Faker::TvShows::StarTrek.location,
    photos_url: "https://picsum.photos/200/300",
    price: rand(1..999,999),
    maximum_guests: rand(1..999,999,999),
    description: Faker::Emotion.noun,
    rotation_time: "#{rand(1..999)} days",
    revolution_time: "#{rand(1..999)} days",
    radius: "#{rand(1000..999,999)} Kilometers",
    avg_temp: "#{rand(-500..500)} Celsius"
  )
end

puts "#{Planet.count} Planets created."
