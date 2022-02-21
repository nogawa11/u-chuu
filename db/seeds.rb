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

puts "#{User.count} Users created"
puts "#{Planet.count} Planets created."
puts "#{Review.count} Reviews created."
