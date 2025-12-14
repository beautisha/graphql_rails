Apartment.delete_all
Resort.delete_all

resort1 = Resort.create!(
  name: "Bahia Blanca Resorts",
  email: "therest@gmail.com",
  description: "Bahia Blanca is a holiday superior apartment resort situated on the island of Gran Canaria"
)

resort2 = Resort.create!(
  name: "Holiday Club Katinkulta",
  email: "book@gmail.com",
  description: "The most versatile holiday resort in the Nordic Countries – is located in the Kainuu region in North Eastern Finland, Vuokatti"
)

# Наполняем первый курорт двумя типами апартаментов.
resort1.apartments.create!(
  room_type: "Superior Room",
  description: "One bedroom and bathroom superior apartment with balcony or yard"
)

resort1.apartments.create!(
  room_type: "Deluxe 2 bedrooms",
  description: "Exclusive luxury suite 80 m with two bedrooms and bathrooms"
)

# Для второго курорта создаём три варианта номеров из примеров.
resort2.apartments.create!(
  room_type: "Single Superior Room",
  description: "Spacious superior-class room with bathroom and balcony"
)

resort2.apartments.create!(
  room_type: "Double Superior Room",
  description: "Every room boasts a balcony with an amazing view of the golf course or the Vuokatti hills"
)

resort2.apartments.create!(
  room_type: "Double Suite",
  description: "Spacious and high-quality suite contain a separate bedroom, living room and bathroom with a sauna"
)
