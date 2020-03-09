# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

puts "Destroying All"

ChatRoom.destroy_all
Booking.destroy_all
Room.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all
Booking.destroy_all





puts "Scrapping and Creating Hotels"

url1_Budapest = "https://www.booking.com/hotel/hu/corinthiaroyal.en-gb.html?aid=1508980&sid=f15d119503c743870f587d0d451915a4"

html_file1 = open(url1_Budapest).read


html_doc1 = Nokogiri::HTML(html_file1)


name = nil
address = nil
html_doc1.search(".hp__hotel-name").each do |elem|
  name = elem.children[2].text.strip
end

html_doc1.search(".hp_address_subtitle").each do |elem|
  address = elem.text.strip
end
stars = nil
html_doc1.search(".hp__hotel_ratings .hp__hotel_ratings__stars .bk-icon-wrapper").each do |elem|
  stars = elem.values.last.scan(/\d+/).join("").to_i
end

puts "Creating Hotel with scrapped data and John Smith user"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583612143/ButlerX/hotel_banner.jpg')

user = User.new(email: "facsr92@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars, first_name: "Hotel", last_name: "Smith" )
user.photo.attach(io: file, filename: 'hotel_banner.jpg', content_type: 'image/jpg')
user.save!

user5 = User.new(email: "franbilio@gmail.com", password: "123456", first_name: "John", last_name: "Smith")
user5.save!


puts "adding booking"
booking1 = Booking.new(check_in: Date.parse('2020-03-04'), check_out: Date.parse('2020-03-14'), booking_number: '2662823182', hotel: user, guest: user5)

booking1.save!



puts "Creating Room"
room1 = Room.new(name: "Apartament Studio with Sea View", room_number: 355, hotel: user, booking_id: booking1.id,  availability: true)
room1.save!

# -----------------2nd hotel-------------------

url2_Paris = "https://www.booking.com/hotel/fr/motel-one-paris-porte-doree.en-gb.html?aid=1508980;sid=f15d119503c743870f587d0d451915a4;dest_id=-1456928;dest_type=city;dist=0;group_adults=2;group_children=0;hapos=1;hpos=1;nflt=review_score%3D90%3B;no_rooms=1;room1=A%2CA;sb_price_type=total;sr_order=popularity;srepoch=1583765148;srpvid=938467cd602300bd;type=total;ucfs=1&#hotelTmpl"

html_file2 = open(url2_Paris).read


html_doc2 = Nokogiri::HTML(html_file2)


name = nil
address = nil
html_doc2.search(".hp__hotel-name").each do |elem|
  name = elem.children[2].text.strip
end

html_doc2.search(".hp_address_subtitle").each do |elem|
  address = elem.text.strip
end
stars = nil
html_doc2.search(".hp__hotel_ratings .hp__hotel_ratings__stars .bk-icon-wrapper").each do |elem|
  stars = elem.values.last.scan(/\d+/).join("").to_i
end

puts "Creating 2nd Hotel"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583766986/ButlerX/paris_yopgjt.jpg')

user2 = User.new(email: "paris@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars, first_name: "Hotel", last_name: "Smith" )
user2.photo.attach(io: file, filename: 'paris_yopgjt.jpg', content_type: 'image/jpg')
user2.save!


puts "adding booking"
booking2 = Booking.new(check_in: Date.parse('2020-03-15'), check_out: Date.parse('2020-03-17'), booking_number: '2660003182', hotel: user2, guest: user5)
booking2.save!



puts "Creating Room"
room2 = Room.new(name: "King Room", room_number: 355, hotel: user2, booking_id: booking2.id,  availability: true)
room2.save!

# -----------------3rd hotel-------------------

url3_Barcelona = "https://www.booking.com/hotel/es/gallery.en-gb.html?aid=1508980;sid=f15d119503c743870f587d0d451915a4;dest_id=-372490;dest_type=city;dist=0;group_adults=2;group_children=0;hapos=2;hpos=2;nflt=review_score%3D90%3B;no_rooms=1;room1=A%2CA;sb_price_type=total;sr_order=popularity;srepoch=1583765700;srpvid=150e68e1c6af006d;type=total;ucfs=1&#hotelTmpl"

html_file3 = open(url3_Barcelona).read


html_doc3 = Nokogiri::HTML(html_file3)


name = nil
address = nil
html_doc3.search(".hp__hotel-name").each do |elem|
  name = elem.children[2].text.strip
end

html_doc3.search(".hp_address_subtitle").each do |elem|
  address = elem.text.strip
end
stars = nil
html_doc3.search(".hp__hotel_ratings .hp__hotel_ratings__stars .bk-icon-wrapper").each do |elem|
  stars = elem.values.last.scan(/\d+/).join("").to_i
end

puts "Creating 3rd Hotel"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583766986/ButlerX/barca_otpbsi.jpg')

user3 = User.new(email: "barsa@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars, first_name: "Hotel", last_name: "Smith" )
user3.photo.attach(io: file, filename: 'barca_otpbsi.jpg', content_type: 'image/jpg')
user3.save!


puts "adding booking"
booking3 = Booking.new(check_in: Date.parse('2020-03-17'), check_out: Date.parse('2020-03-19'), booking_number: '2790003001', hotel: user3, guest: user5)
booking3.save!



puts "Creating Room"
room3 = Room.new(name: "Queen Room", room_number: 355, hotel: user3, booking_id: booking3.id,  availability: true)
room3.save!





# -----------------4th hotel-------------------

url4_Bangkok= "https://www.booking.com/hotel/th/happy-station-hostel.en-gb.html?aid=1508980;sid=f15d119503c743870f587d0d451915a4;dest_id=-3414440;dest_type=city;dist=0;group_adults=2;group_children=0;hapos=1;hpos=1;nflt=review_score%3D90%3B;no_rooms=1;room1=A%2CA;sb_price_type=total;sr_order=popularity;srepoch=1583765901;srpvid=cff069463c080093;type=total;ucfs=1&#hotelTmpl"

html_file4 = open(url4_Bangkok).read


html_doc4 = Nokogiri::HTML(html_file4)


name = nil
address = nil
html_doc4.search(".hp__hotel-name").each do |elem|
  name = elem.children[2].text.strip
end

html_doc4.search(".hp_address_subtitle").each do |elem|
  address = elem.text.strip
end
stars = nil
html_doc4.search(".hp__hotel_ratings .hp__hotel_ratings__stars .bk-icon-wrapper").each do |elem|
  stars = elem.values.last.scan(/\d+/).join("").to_i
end

puts "Creating 4th Hotel"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583766986/ButlerX/bangkok_t8seke.jpg')
user4 = User.new(email: "bang@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars, first_name: "Hotel", last_name: "Smith" )
user4.photo.attach(io: file, filename: 'bangkok_t8seke.jpg', content_type: 'image/jpg')
user4.save!


puts "adding booking"
booking4 = Booking.new(check_in: Date.parse('2020-03-19'), check_out: Date.parse('2020-03-22'), booking_number: '2120003112', hotel: user4, guest: user5)
booking4.save!



puts "Creating Room"
room4 = Room.new(name: "King Room", room_number: 355, hotel: user4, booking_id: booking4.id,  availability: true)
room4.save!



# Creating chatrooms for all the bookings


chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking1.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!

chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking2.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!
chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking3.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!
chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking4.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!


puts "Creating Events for First Hotel Only"


# # ---------------------------------------------------------------
# # Creating events

description = "13-03-2020 7PM"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322866/ButlerX/InesHotel/lewagon_event_ldeouc.jpg')
event1 = Event.new(name: "Le Wagon Lisbon, Batch 346 - Demo Day" , description: description, hotel: user)
event1.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
event1.save!

description2 = "14-03-2020 4PM"


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583768695/ButlerX/PingPong_r4unff.jpg')
event2 = Event.new(name: "Ping Pong Competition", description: description2, hotel: user)
event2.photo.attach(io: file, filename: 'voa.jpg', content_type: 'image/jpg')
event2.save!

description3 = "15-03-2020 9PM"


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583768695/ButlerX/jazz-night_f5jlwz.jpg')
event3 = Event.new(name: "Jazz Night", description: description3, hotel: user)
event3.photo.attach(io: file, filename: 'voa.jpg', content_type: 'image/jpg')
event3.save!

description4 = "16-03-2020 7PM"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583768732/ButlerX/tacos_jwmot8.jpg')
event4 = Event.new(name: "Mexican Night", description: description4, hotel: user)
event4.photo.attach(io: file, filename: 'voa.jpg', content_type: 'image/jpg')
event4.save!


description5 = "17-03-2020 7PM"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583768731/ButlerX/chinesenypicture_fihydp.jpg')
event5 = Event.new(name: "Chinese Night", description: description5, hotel: user)
event5.photo.attach(io: file, filename: 'voa.jpg', content_type: 'image/jpg')
event5.save!


# ----------------------------------------------------------------------------------

puts "Creating Meals"


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322866/ButlerX/InesHotel/cozido_jyrpop.jpg')
name_meal = "Buffet Cozido à Portuguesa"
description_meal = "Cozido à portuguesa é um cozido tradicional português. Trata-se de uma iguaria composta por uma miríade de vegetais, carnes e enchidos cozidos. No que diz respeito aos vegetais, podem ser cozidos feijões, batatas, cenouras, nabos, couves e arroz."
price_cents = 12

meal = Meal.new(name: name_meal, description: description_meal, price: price_cents)
meal.photo.attach(io: file, filename: 'cozido.jpg', content_type: 'image/jpg')
meal.save!

# #  5th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/bacalhau_chtwdq.jpg')
name_meal = "Bacalhau à Brás tradicional"
description_meal = "A receita de Bacalhau à Brás tradicional que trouxemos até si, é económica e simples de preparar,  acompanhe-a com uma salada de alface cortada em juliana, azeitonas e um bom copo de vinho branco.
O bacalhau é um peixe magro com cerca de 70 Kcal por cada 100 gramas. É rico em magnésio e potássio e deve ser salgado manter a sua conservação. O bacalhau é demolhado e a seguir cozinha-se no forno, na frigideira, na brasa ou simplesmente cozido em água.

Em Portugal, existem 1001 maneiras de cozinhar bacalhau, umas mais tradicionais outras mais criativas. Os portugueses adoram e consomem o bacalhau em qualquer ponto do país.

Segundo a Dona Dolores, Bacalhau à Brás é um dos pratos preferidos do seu filho e melhor jogador do mundo Cristiano Ronaldo."
price_cents = 12

meal = Meal.new(name: name_meal, description: description_meal, price: price_cents)
meal.photo.attach(io: file, filename: 'bacalhau.jpg', content_type: 'image/jpg')
meal.save!

# #  6th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/feijoada_p9f7fr.jpg')
name_meal = "Feijoada tradicional"
description_meal = "DescriçãoFeijoada é uma designação comum dada a pratos da culinária de regiões e países lusófonos como Portugal, Brasil, Angola, Moçambique, Timor-Leste e Macau. Consiste num guisado de feijão, normalmente com carne, e quase sempre acompanhado com arroz."
price_cents = 15

meal = Meal.new(name: name_meal, description: description_meal, price: price_cents)
meal.photo.attach(io: file, filename: 'feijoada.jpg', content_type: 'image/jpg')
meal.save!

# # 7th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/ovos_k4ecyj.jpg')
name_meal = "Ovos mexidos"
description_meal = "Ovos mexidos é um prato de culinária feito a partir de ovos de galinha. Os ovos são mexidos e vertidos numa frigideira quente, usualmente untada com gordura e mexidos com um utensílio de cozinha, até começarem a coagular. Este é um prato conhecido e usado no mundo inteiro."
price_cents = 10

meal = Meal.new(name: name_meal, description: description_meal, price: price_cents)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!

puts "Meals done"

# -----------------------------------------------------------------------------------

puts "Creating Services"

# -----------------------

puts "Creating Services "

puts "Adding massage"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583774579/ButlerX/massage_uoehi0.jpg')
name_service = "Massage"
description_service = "45 minutes therapeutic massage session that is done to relieve pain, tensions, stiffness, knots, prevent problems, unblock the energetic channels of the body (the meridians) through acupressure, manipulations, stretching, relax the mind from stress, improve any emotion issues, detox, improve flexibility of the muscles and joints."
category_service = "Wellness"
price_cents = 45

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service1.photo.attach(io: file, filename: 'massage.jpg', content_type: 'image/jpg')
service1.save!

puts "Adding full day in spa"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583775780/ButlerX/spa_apedy3.jpg')
name_service = "Day in Spa"
description_service = "Full day in spa"
category_service = "Wellness"
price_cents = 120

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service1.photo.attach(io: file, filename: 'spa.jpg', content_type: 'image/jpg')
service1.save!

puts "Closed Swimming pool"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583775947/ButlerX/mandlay-spa-1-f_dygj3v.jpg')
name_service = "Indoor swimming pool"
description_service = "This hotel offers services of closed swimming pull."
category_service = "Sport Activities"
price_cents = 35

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service1.photo.attach(io: file, filename: 'pool.jpg', content_type: 'image/jpg')
service1.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583774579/ButlerX/car_cuepre.jpg')
name_service = "Rent a car"
description_service = "More details on car selection available upon contacting front desk customer service"
category_service = "General"
price_cents = 15

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service1.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service1.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583776154/ButlerX/teniscourt_h1un19.jpg')
name_service = "Outdoor tennis court"
description_service = "Este hotel dispõe de 1 campo de ténis para os entusiastas de desportos de raquete."
category_service = "Sport Activities"
price_cents = 10

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583776312/ButlerX/outdoors_e8mnt2.jpg')

name_service = "Outdoor Activities"
description_service = "Outdoor Activities are plenty for our customers, such as cycling and excursions. The hotel supplies guides for these activities and you can easily schedule it. All schedules need to be made with at least 24h in advance."
category_service = "Sport Activities"
price_cents = 15

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583776312/ButlerX/event-space_pgu6ow.jpg')

name_service = "Rent a Space"
description_service = "The hotel offers 4 conference rooms of a different price, with capacity between 10 and 50 people."
category_service = "General"
price_cents = 60

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!



puts "Done! F to the Yeah!"




