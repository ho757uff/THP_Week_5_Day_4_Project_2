# Vider la base
Stroll.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
City.destroy_all

# ---

# Création de villes
cities = ["Paris", "Lyon", "Marseille", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille"]
city_objects = cities.map do |city_name|
  City.create(city_name: city_name)
end

# Création de promeneurs de chiens
20.times do
  Dogsitter.create(name: Faker::Name.unique.name, city: city_objects.sample)
end

# Création de chiens
100.times do
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, city: city_objects.sample)
end

# Création de promenades
Dog.all.each do |dog|
  matching_dogsitters = Dogsitter.where(city: dog.city)
  Stroll.create(date: Faker::Date.between(from: "2022-01-01", to: "2023-12-31"), time: Faker::Time.forward(days: 365, period: :day), dogsitter: matching_dogsitters.sample, dog: dog)
end
