# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.find_or_create_by!(address: "Temeraire Court", title: "Penthouse flat hosted by Chris", description: "Hi I'm Chris, welcome to my flat...", price_per_night: 100, minimum_nights: 3, cleaning_fee: 50, max_guests: 4, bedrooms: 2, bathrooms: 2, pet_friendly: true)

