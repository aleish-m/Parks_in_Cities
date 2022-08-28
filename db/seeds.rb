# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

denver = City.create!(name: 'Denver', population: 1000, state_capital: true)
csprings= City.create!(name: 'Colorado Springs', population: 190, state_capital: false)
foco = City.create!(name: 'Fort Collins', population: 80, state_capital: false)

city_park = denver.parks.create!(name: 'City Park', acres: 330, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
sloans = denver.parks.create!(name: "Sloan's Lake Park", acres: 177, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
civic = denver.parks.create!(name: "Civic Center Park", acres: 12, visitor_center: false, playground: false, opening_hour: 5, closing_hour: 11)
skyline = denver.parks.create!(name: "Skyline Park", acres: 1, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 11)


nancy = csprings.parks.create!(name: 'Nancy Lewis Park', acres: 9, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
america = csprings.parks.create!(name: 'America the Beautiful Park', acres: 17, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 10)
gog = csprings.parks.create!(name: 'Garden of the Gods', acres: 1341, visitor_center: true, playground: false, opening_hour: 5, closing_hour: 9)

fossil = foco.parks.create!(name: 'Fossil Creek Park', acres: 100, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
foco_citypark = foco.parks.create!(name: 'City Park', acres: 85, visitor_center: false, playground: true, opening_hour: 5, closing_hour: 11)
lee = foco.parks.create!(name: 'Lee Martinez Park', acres: 89, visitor_center: true, playground: true, opening_hour: 5, closing_hour: 11)