# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_role = Role.create(name: "Admin")
customer_role = Role.create(name: "Customer")
vip_role = Role.create(name: "Premium")

create_cinema = Cinema.create(cinema_name: "TGV KLCC", contact: "+60 4-261 6670", address: "1 Jalan Ampang Kuala Lumpur City Centre, Kuala Lumpur, Federal Territory of Kuala Lumpur, 50088, Kuala Lumpur, WP Kuala Lumpur, Malaysia", state: "Kuala Lumpur", company: "TGV", latitude: 3.156969, longitude: 101.711586)

create_movie = Movie.create(title: "The Fate of The Furious", description: "When a mysterious woman seduces Dom into the world of terrorism and a betrayal of those closest to him, the crew face trials that will test them as never before.", genre: "Action, Crime, Thriller", trailer_url: "5XBmsl7wbIQ", cast: "Vin Diesel, Jason Statham, Dwayne Johnson", rating: 7, duration: 136 )
