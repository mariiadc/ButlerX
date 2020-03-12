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

CartItem.destroy_all
Cart.destroy_all
ChatRoom.destroy_all
Booking.destroy_all
Room.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all
Booking.destroy_all
Meal.destroy_all




puts "Scrapping and Creating Hotels"


user5 = User.new(email: "franbilio@gmail.com", password: "123456", first_name: "John", last_name: "Smith")
user5.save!


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1584026100/ButlerX/lewagon_jticen.jpg')



user = User.new(email: "facsr92@gmail.com", password: "123456", role: 1, name: "Boutique em frente de Le Wagon", address: "Rua do Conde Redondo 60, Lisbon", stars: 5, first_name: "Hotel", last_name: "Smith" )
user.photo.attach(io: file, filename: 'hotel_banner.jpg', content_type: 'image/jpg')
user.save!

puts "Creating Room"
key = "Room booked for #{user5.first_name} #{user5.last_name}, on #{user.name} between #{Date.parse('2020-03-04')} and #{Date.parse('2020-03-14')}. Booking number is: 2662823182. Room: #{335}."
room = Room.new(name: "Apartament Studio with City View", room_number: 335, hotel: user, key: key,  availability: true)
room.save!

puts "adding booking"
booking = Booking.new(check_in: Date.parse('2020-03-04'), check_out: Date.parse('2020-03-14'), booking_number: '2000023182', hotel: user, guest: user5, room_id: room.id)

booking.save!










# ----------------1st hotel-------------------------------------------------------
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



user1 = User.new(email: "a@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars, first_name: "Hotel", last_name: "Smith" )
user1.photo.attach(io: file, filename: 'hotel_banner.jpg', content_type: 'image/jpg')
user1.save!

puts "Creating Room"
key = "Room booked for #{user5.first_name} #{user5.last_name}, on #{user.name} between #{Date.parse('2020-03-15')} and #{Date.parse('2020-03-18')}. Booking number is: 2662823182. Room: #{355}."
room1 = Room.new(name: "Apartament Studio with Sea View", room_number: 355, hotel: user1, key: key,  availability: true)
room1.save!

puts "adding booking"
booking1 = Booking.new(check_in: Date.parse('2020-03-14'), check_out: Date.parse('2020-03-15'), booking_number: '2662823182', hotel: user1, guest: user5, room_id: room1.id)

booking1.save!





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


puts "Creating Room"
key = "Room booked for #{user5.first_name} #{user5.last_name}, on #{user2.name} between #{Date.parse('2020-03-18')} and #{Date.parse('2020-03-23')}. Booking number is: 2660003182. Room: #{355}."
room2 = Room.new(name: "King Room", room_number: 355, hotel: user2, key: key,  availability: true)
room2.save!

puts "adding booking"
booking2 = Booking.new(check_in: Date.parse('2020-03-15'), check_out: Date.parse('2020-03-17'), booking_number: '2660003182', hotel: user2, guest: user5, room_id: room2.id)
booking2.save!





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


puts "Creating Room"
key = "Room booked for #{user5.first_name} #{user5.last_name}, on #{user3.name} between #{Date.parse('2020-03-24')} and #{Date.parse('2020-03-27')}. Booking number is: 2790003001. Room: #{355}."
room3 = Room.new(name: "Queen Room", room_number: 355, hotel: user3, key: key,  availability: true)
room3.save!

puts "adding booking"
booking3 = Booking.new(check_in: Date.parse('2020-03-17'), check_out: Date.parse('2020-03-19'), booking_number: '2790003001', hotel: user3, guest: user5, room_id: room3.id)
booking3.save!




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

puts "Creating Room"
key = "Room booked for #{user5.first_name} #{user5.last_name}, on #{user4.name} between #{Date.parse('2020-03-27')} and #{Date.parse('2020-03-28')}. Booking number is: 2120003112. Room: #{355}."
room4 = Room.new(name: "King Room", room_number: 355, hotel: user4, key: key,  availability: true)
room4.save!


puts "adding booking"
booking4 = Booking.new(check_in: Date.parse('2020-03-19'), check_out: Date.parse('2020-03-22'), booking_number: '2120003112', hotel: user4, guest: user5, room_id: room4.id)
booking4.save!



# Creating chatrooms for all the bookings
chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!

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

 puts "Meal 1"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322866/ButlerX/InesHotel/cozido_jyrpop.jpg')
name_meal = "Homemade stew"
description_meal = "..."
price_cents = 1200

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'cozido.jpg', content_type: 'image/jpg')
meal.save!

#---------------


 puts "Meal 2"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/bacalhau_chtwdq.jpg')
name_meal = "Cod à Brás"
description_meal = "..."
price_cents = 1200

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'bacalhau.jpg', content_type: 'image/jpg')
meal.save!

#---------------

 puts "Meal 3"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/feijoada_p9f7fr.jpg')
name_meal = "Beans stew"
description_meal = "..."
price_cents = 1500

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'feijoada.jpg', content_type: 'image/jpg')
meal.save!

#---------------

 puts "Meal 4"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/ovos_k4ecyj.jpg')
name_meal = "Scrambled Eggs"
description_meal = "..."
price_cents = 1000

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!

#-------##--------

 puts "Meal 5"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583832380/ButlerX/enbreakfast_jw2mon.jpg')
name_meal = "English Breakfast"
description_meal = "..."
price_cents = 2100

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 6"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831416/ButlerX/meatwrap_na8pio.jpg')
name_meal = "Meat Wrap"
description_meal = "..."
price_cents = 1200

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 7"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831416/ButlerX/pizza_uxedea.jpg')
name_meal = "Pepperoni Pizza"
description_meal = "..."
price_cents = 1100

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 8"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583833198/ButlerX/fried-chicken-burger-with-sriracha-thai-slaw-cheese-and-ranch-mayo-page_bhdgcp.jpg')
name_meal = "Burger"
description_meal = "..."
price_cents = 950

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 9"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583836743/ButlerX/fries_ynjy4n.jpg')
name_meal = "French Fries"
description_meal = "..."
price_cents = 700

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 10"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/goulashsoup_siy4ue.jpg')
name_meal = "Goulash Soup"
description_meal = "..."
price_cents = 1500

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 11"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/meatstuffedcabbage_mbhc9n.jpg')
name_meal = "Meat Stuffed Cabbage"
description_meal = "..."
price_cents = 1900

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 12"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/waterwithgas_rjcjzz.jpg')
name_meal = "Water with gas"
description_meal = "..."
price_cents = 500

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 13"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/water_p63req.jpg')
name_meal = "Water Natural"
description_meal = "..."
price_cents = 400

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 14"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/7uplata-600x600_hbq2lz.jpg')
name_meal = "7 Up"
description_meal = "..."
price_cents = 560

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 15"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831415/ButlerX/287649_1_xnl_kcg3pz.jpg')
name_meal = "Coca-Cola"
description_meal = "..."
price_cents = 560

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 16"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583831545/ButlerX/71W_3bONurL._AC_SL1500__bxqacb.jpg')
name_meal = "Bottle of red wine"
description_meal = "..."
price_cents = 2500

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
meal.save!
#---------------

 puts "Meal 17"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583837431/ButlerX/btlofwine_k0c7gf.jpg')
name_meal = "Bottle of white wine"
description_meal = "..."
price_cents = 2500

meal = Meal.new(name: name_meal, description: description_meal, price_cents: price_cents, hotel_id: user.id, sku: name_meal)
meal.photo.attach(io: file, filename: 'wine.jpg', content_type: 'image/jpg')
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

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service1.photo.attach(io: file, filename: 'massage.jpg', content_type: 'image/jpg')
service1.save!

puts "Adding full day in spa"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583775780/ButlerX/spa_apedy3.jpg')
name_service = "Day in Spa"
description_service = "Full day in spa"
category_service = "Wellness"
price_cents = 85

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service1.photo.attach(io: file, filename: 'spa.jpg', content_type: 'image/jpg')
service1.save!

puts "Closed Swimming pool"
file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583775947/ButlerX/mandlay-spa-1-f_dygj3v.jpg')
name_service = "Indoor swimming pool"
description_service = "This hotel offers services of closed swimming pull."
category_service = "Sport Activities"
price_cents = 35

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service1.photo.attach(io: file, filename: 'pool.jpg', content_type: 'image/jpg')
service1.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583928177/ButlerX/car2_qnubv0.jpg')
name_service = "Rent a car"
description_service = "More details on car selection available upon contacting front desk customer service"
category_service = "General"
price_cents = 150

service1 = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service1.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service1.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583776154/ButlerX/teniscourt_h1un19.jpg')
name_service = "Outdoor tennis court"
description_service = "Este hotel dispõe de 1 campo de ténis para os entusiastas de desportos de raquete."
category_service = "Sport Activities"
price_cents = 100

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!


file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583776312/ButlerX/outdoors_e8mnt2.jpg')

name_service = "Outdoor Activities"
description_service = "Outdoor Activities are plenty for our customers, such as cycling and excursions. The hotel supplies guides for these activities and you can easily schedule it. All schedules need to be made with at least 24h in advance."
category_service = "Sport Activities"
price_cents = 15

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583933333/ButlerX/event-space3_gnurlp.jpg')

name_service = "Rent a Space"
description_service = "The hotel offers 4 conference rooms of a different price, with capacity between 10 and 50 people."
category_service = "General"
price_cents = 60

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user, sku: name_service)
service.photo.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
service.save!



puts "Done! F to the Yeah!"




