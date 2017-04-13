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

#cinema 1
create_cinema = Cinema.create(cinema_name: "TGV KLCC", contact: "+60 4-261 6670", address: "1 Jalan Ampang Kuala Lumpur City Centre, Kuala Lumpur, Federal Territory of Kuala Lumpur, 50088, Kuala Lumpur, WP Kuala Lumpur, Malaysia", state: "Kuala Lumpur", company: "TGV", latitude: 3.156969, longitude: 101.711586)

create_movie = Movie.create(title: "The Fate of The Furious", description: "When a mysterious woman seduces Dom into the world of terrorism and a betrayal of those closest to him, the crew face trials that will test them as never before.", genre: "Action, Crime, Thriller", trailer_url: "5XBmsl7wbIQ", cast: "Vin Diesel, Jason Statham, Dwayne Johnson", rating: 7, duration: 136 )

#cinema 2
create_cinema = Cinema.create(cinema_name: "GSC Mid Valley", contact: "+60 3-29383333", address: "Mid Valley Megamall, 75, Lingkaran Syed Putra, Mid Valley City, 58000, Kuala Lumpur, Wilayah Persekutuan", state: "Kuala Lumpur", company: "GSC", latitude: 3.117484, longitude: 101.677995)




#cinema 3
create_cinema = Cinema.create(cinema_name: "MBO Citta Mall", contact: "+60 3-7734 7975", address: "Lot R03 , 3rd Floor, Citta Mall, No.1, Jalan PJU 1A/48, PJU 1A, Ara Damansara, Petaling Jaya, Selangor, Pusat Perdagangan Dana 1, 47301 Petaling Jaya, Selangor, Malaysia", state: "Kuala Lumpur", company: "MBO", latitude: 3.112343, longitude: 101.578448)
