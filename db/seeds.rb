puts "Removing Old Users, Planets, Reservations, and Reviews..."
Review.destroy_all
Reservation.destroy_all
Planet.destroy_all
User.destroy_all

puts "Creating New Users..."

owner = User.new(
  name: "lewagon",
  email: "lewagon@gmail.com",
  password: "123123"
)
owner.save!

renter = User.new(
  name: "lewagonrenter",
  email: "lewagonrenter@gmail.com",
  password: "123123"
)
renter.save!

puts "Creating New Planets & Review..."

anteverse = Planet.new(
  name: "Anteverse",
  location: "Anteverse system",
  price_per_night: 90420,
  maximum_guests: 30,
  description: "The Anteverse is almost kaleidoscopic in appearance, sporting multiple colors across a barren wasteland engulfed in storm clouds against the backdrop of a burning yellow planet and red sky. The environment of the Anteverse contains a lake or 'sea' comprised of a thick water like substance native to the Precursors' world, directed or channeled into large sacs where life forms lived and grew.",
  rotation_time: 130,
  revolution_time: 249,
  radius: 4920,
  avg_temp: 120
)
anteverse.user = owner
anteverse.save!

review = Review.new(
  rating: 2,
  content: "Kaiju are too scary for the kids",
  user: renter
)
review.planet = anteverse
review.save!

reviewtwo = Review.new(
  rating: 4,
  content: "Absolutely fascinating!",
  user: renter
)
reviewtwo.planet = anteverse
reviewtwo.save!

arrakis = Planet.new(
  name: "Arrakis",
  location: "Canopus star system",
  price_per_night: 504800,
  maximum_guests: 15,
  description: "Arrakis is the third planet orbiting the star Canopus, and it in turn is orbited by two moons, one of which has an albedo pattern resembling the desert kangaroo mouse, Muad'Dib, on it; the other moon has markings resembling a human hand.",
  rotation_time: 135,
  revolution_time: 249,
  radius: 1365,
  avg_temp: 120
)
arrakis.user = owner
arrakis.save!

reviewthree = Review.new(
  rating: 4,
  content: "Very nice spices!",
  user: renter
)
reviewthree.planet = arrakis
reviewthree.save!

reviewfour = Review.new(
  rating: 5,
  content: "I think I saw Timothy Chalamet here!",
  user: renter
)
reviewfour.planet = arrakis
reviewfour.save!

cybertron = Planet.new(
  name: "Cybertron",
  location: "Canopus star system",
  price_per_night: 375000,
  maximum_guests: 300,
  description: "Cybertron is the home planet of the Transformers and (usually) the body of their creator, Primus. Cybertron is (almost always) a shining metal, technological world; a planet of towering future cities without end and vast metallic plains, spiraling metal mountains and bottomless neon-lit chasms.",
  rotation_time: 364,
  revolution_time: 1254,
  radius: 7930,
  avg_temp: -100
)
cybertron.user = owner
cybertron.save!

reviewfive = Review.new(
  rating: 1,
  content: "Inhabited by weird robots...",
  user: renter
)
reviewfive.planet = cybertron
reviewfive.save!

reviewsix = Review.new(
  rating: 2,
  content: "I think the whole planet is just a robot...",
  user: renter
)
reviewsix.planet = cybertron
reviewsix.save!

cybertron = Planet.new(
  name: "Cybertron",
  location: "Canopus star system",
  price_per_night: 375000,
  maximum_guests: 300,
  description: "Cybertron is the home planet of the Transformers and (usually) the body of their creator, Primus. Cybertron is (almost always) a shining metal, technological world; a planet of towering future cities without end and vast metallic plains, spiraling metal mountains and bottomless neon-lit chasms.",
  rotation_time: 364,
  revolution_time: 1254,
  radius: 7930,
  avg_temp: -100
)
cybertron.user = owner
cybertron.save!

reviewfive = Review.new(
  rating: 1,
  content: "Inhabited by weird robots...",
  user: renter
)
reviewfive.planet = cybertron
reviewfive.save!

reviewsix = Review.new(
  rating: 2,
  content: "I think the whole planet is just a robot...",
  user: renter
)
reviewsix.planet = cybertron
reviewsix.save!

ego = Planet.new(
  name: "Ego",
  location: "Constantly moving!",
  price_per_night: 258000,
  maximum_guests: 5,
  description: "Ego was able to use his molecular manipulation to create a shell around himself which, after millions of years, evolved into a planet. His brain is stored in the center of his planet's core, while his energy form can traverse the planet and use the matter it manipulated to make itself physically manifest. ",
  rotation_time: 2,
  revolution_time: 153,
  radius: 1257,
  avg_temp: 27
)
ego.user = owner
ego.save!

reviewseven = Review.new(
  rating: 0,
  content: "Not cool!! Planet turned out to be a weird old man!",
  user: renter
)
reviewseven.planet = ego
reviewseven.save!

revieweight = Review.new(
  rating: 4,
  content: "Great scenic views!",
  user: renter
)
revieweight.planet = ego
revieweight.save!

endor = Planet.new(
  name: "Endor",
  location: "Endor system",
  price_per_night: 105000,
  maximum_guests: 25,
  description: "Endor, also called Tana by the Ewoks native to one of its moons, was a gas giant located in the Endor system, a binary star system positioned in the Moddell sector of the galaxy's Outer Rim Territories. Endor acted almost like a second sun to the moons with its clouds of hydrogen reflecting light. Located in grid square H-16 on the Standard Galactic Grid, it was connected to Cerea and Bakura by a hyperspace route. The planet was orbited by nine major moons, the largest of which was known as the Forest Moon of Endor. The ocean moon of Kef Bir was also one of Endor's moons. Additionally, 48 'sub-lunar' objects orbited the planet.",
  rotation_time: 18,
  revolution_time: 402,
  radius: 2450,
  avg_temp: 20
)
endor.user = owner
endor.save!

reviewnine = Review.new(
  rating: 5,
  content: "This ta e great planet! Meechoo recommend five zehg of five!",
  user: renter
)
reviewnine.planet = endor
reviewnine.save!

reviewten = Review.new(
  rating: 4,
  content: "Nice foresty planet!",
  user: renter
)
reviewten.planet = endor
reviewten.save!


felucia = Planet.new(
  name: "Felucia",
  location: "Felucia system",
  price_per_night: 1000240,
  maximum_guests: 300,
  description: "Felucia, known as Galush prior to the formation of the Galactic Republic, was a colorful, humid jungle planet located in the Felucia system of the galaxy's Outer Rim Territories. The headquarters of the Commerce Guild, its primary agricultural export was the valuable crop nysillin, which was largely farmed by the native Felucian tribes. ",
  rotation_time: 34,
  revolution_time: 231,
  radius: 4550,
  avg_temp: 40
)
felucia.user = owner
felucia.save!

revieweleven = Review.new(
  rating: 3,
  content: "Lots of plants and swamps!",
  user: renter
)
revieweleven.planet = felucia
revieweleven.save!

reviewtwelve = Review.new(
  rating: 4,
  content: "Took my family here for vacation and they loved it!",
  user: renter
)
reviewtwelve.planet = felucia
reviewtwelve.save!

puts "Creating New Reservations..."

5.times do
  reservation = Reservation.new(
    reservation_status: rand(0..2),
    start_date: Faker::Date.forward(days: rand(1..30)),
    end_date: Faker::Date.forward(days: rand(31..90)),
    number_of_guests: rand(1..999_999),
    planet: Planet.all.sample,
    user: renter
  )
  reservation.save!
end

puts "#{User.count} Users created"
puts "#{Planet.count} Planets created"
puts "#{Review.count} Reviews created"
puts "#{Reservation.count} Reservations created"
