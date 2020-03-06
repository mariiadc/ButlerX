# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

puts "Destroying All"

ChatRoom.destroy_all
Booking.destroy_all
Room.destroy_all
Service.destroy_all
Event.destroy_all
User.destroy_all



puts "Scrapping and Creating Hotel"


url = "https://www.booking.com/hotel/pt/anc-experience-resort-portugal.pt-pt.html?aid=318615;label=Portuguese_Portugal_PT_PT_29562095185-fz7ZSwfgKAwgr6pNdcjmEwS217289903890%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi12946906577%3Atiaud-146342135830%3Adsa-302476728953%3Alp1011742%3Ali%3Adec%3Adm;sid=eaa486b93b330685335d7ad32e1c2656;dest_id=-2160876;dest_type=city;dist=0;from_beach_non_key_ufi_sr=1;group_adults=2;group_children=0;hapos=1;hpos=1;no_rooms=1;room1=A%2CA;sb_price_type=total;sr_order=popularity;srepoch=1583243636;srpvid=762161ba42e1004c;type=total;ucfs=1&#hotelTmpl"
# url_2 = "https://www.booking.com/hotel/pt/furnas-spa.pt-pt.html?aid=318615;label=Portuguese_Portugal_PT_PT_29562095185-fz7ZSwfgKAwgr6pNdcjmEwS217289903890%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi12946906577%3Atiaud-146342135830%3Adsa-302476728953%3Alp1011742%3Ali%3Adec%3Adm;sid=b9c27c66c31a25a000a46b553dd45159;dest_id=-2166260;dest_type=city;dist=0;group_adults=2;group_children=0;hapos=3;hpos=3;no_rooms=1;room1=A%2CA;sb_price_type=total;sr_order=popularity;srepoch=1583245382;srpvid=f07e65221383008a;type=total;ucfs=1&#hotelTmpl"

html_file = open(url).read
# html_file2 = open(url_2).read

html_doc = Nokogiri::HTML(html_file)


name = nil
address = nil
html_doc.search(".hp__hotel-name").each do |elem|
  name = elem.children[2].text.strip
end

html_doc.search(".hp_address_subtitle").each do |elem|
  address = elem.text.strip
end
stars = nil
html_doc.search(".hp__hotel_ratings .hp__hotel_ratings__stars .bk-icon-wrapper").each do |elem|
  stars = elem.values.last.scan(/\d+/).join("").to_i
end

puts "Creating Hotel with scrapped data and John Smith user"
user = User.new(email: "facsr92@gmail.com", password: "123456", role: 1, name: name, address: address, stars: stars )
user.save!
user2 = User.new(email: "franbilio@gmail.com", password: "123456", first_name: "John", last_name: "Smith")
user2.save!

puts "Creating Rooms"

# ROOMS Creating

room_names = []
html_doc.search(".hotelchars .description .room-info .jqrt").each do |elem|
  room_names << elem.text.strip
end

# Creating Rooms for hotel!

room_names.each do |elem|
    5.times do |i|
      i += 1
      i = i.to_s
      room = Room.new(name: elem, room_number: i, hotel: user, availability: true)
      room.save!
    end
end

puts "Creating 2 Events for Ines Hotel"


# # ---------------------------------------------------------------
# # Creating events
description = "Demo Day is a showcase of our students' work for our community.
It is a demo of their prototypes, a celebration of their achievements, and the beginning of our students new journey into tech. New jobs, new startups, new opportunities, and new mindsets are created.

Projects Phase is the ultimate experience in Le Wagon's Coding Bootcamp: invent, pitch, design, code and deploy an original project in teams of 3 or 4 people during the two final weeks (or month for our part-timers). On the last day of the bootcamp, our Wagoners will present their products at our hugely popular Demo Day!"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322866/ButlerX/InesHotel/lewagon_event_ldeouc.jpg')
event1 = Event.new(name: "Le Wagon Lisbon, Batch 346 - Demo Day" , description: description, hotel: user)
event1.photo.attach(io: file, filename: 'demo.jpg', content_type: 'image/jpg')
event1.save!

description2 = "
AMON AMARTH, SEPULTURA e SYLOSIS são as mais recentes confirmações para a edição de 2020 do VOA – HEAVY ROCK FESTIVAL

A PRIME ARTISTS confirma hoje três novos nomes na edição de 2020 do VOA – HEAVY ROCK FESTIVAL: aos já anunciados SYSTEM OF A DOWN, KORN, MESHUGGAH e BIZARRA LOCOMOTIVA juntam-se os brasileiros SEPULTURA a 2 de julho; no dia seguinte, 3 de julho, os suecos AMON AMARTH e os britânicos SYLOSIS reforçam a programação encabeçada pelos BRING ME THE HORIZON e OF MICE & MEN. Três propostas que prometem tornar ainda mais memorável a 11.ª edição do VOA – HEAVY ROCK FESTIVAL: SEPULTURA, uma lenda do thrash dos anos 80; AMON AMARTH, porta-estandartes do death metal melódico de inspiração viking; e SYLOSIS, uma das forças mais aplaudidas da nova geração da música de peso"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/voa_event_quaju9.jpg')
event2 = Event.new(name: "VOA 2020 - HEAVY ROCK FESTIVAL", description: description2, hotel: user)
event2.photo.attach(io: file, filename: 'voa.jpg', content_type: 'image/jpg')
event2.save!

# ----------------------------------------------------------------------------------

# Creating Meals

# Not doing this anymore. we dropped the model

# -----------------------------------------------------------------------------------

puts "Creating Services and Meals"

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583334267/ButlerX/InesHotel/piscina_aqjjfz.jpg')
name_service = "Piscina"
description_service = "Este hotel dispõe de 2 piscinas exteriores com vistas para o Oceano Atlântico. Ponta Delgada, a maior cidade do Arquipélago dos Açores, fica a 14 km."
category_service = "Wellness"
price_cents = 5

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user )
service.photo.attach(io: file, filename: 'pool.jpg', content_type: 'image/jpg')
service.save!

name_service = "Campo de ténis"
description_service = "Este hotel dispõe de 1 campo de ténis para os entusiastas de desportos de raquete."
category_service = "Wellness"
price_cents = 10

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.save

name_service = "Outdoor Activities"
description_service = "Outdoor Activities are plenty for our customers, such as cycling and excursions. The hotel supplies guides for these activities and you can easily schedule it. All schedules need to be made with at least 24h in advance."
category_service = "Wellness"
price_cents = 15

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.save


# # 2nd service

name_service = "Free Wi-Fi"
description_service = "Acesso Wi-Fi disponível por todo o hotel. Custo: Gratuito"
category_service = "Geral"
price_cents = 0

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.save

# # 3rd service

name_service = "Aluguer de transporte"
description_service = "Contacte-nos através do chat para mais informação se necessita de alugar algum meio de transporte."
category_service = "Geral"
price_cents = 0

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.save

# # 4th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322866/ButlerX/InesHotel/cozido_jyrpop.jpg')
name_service = "Buffet Cozido à Portuguesa"
description_service = "Cozido à portuguesa é um cozido tradicional português. Trata-se de uma iguaria composta por uma miríade de vegetais, carnes e enchidos cozidos. No que diz respeito aos vegetais, podem ser cozidos feijões, batatas, cenouras, nabos, couves e arroz."
category_service = "Meal"
price_cents = 12

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'cozido.jpg', content_type: 'image/jpg')
service.save!

# #  5th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/bacalhau_chtwdq.jpg')
name_service = "Bacalhau à Brás tradicional"
description_service = "A receita de Bacalhau à Brás tradicional que trouxemos até si, é económica e simples de preparar,  acompanhe-a com uma salada de alface cortada em juliana, azeitonas e um bom copo de vinho branco.
O bacalhau é um peixe magro com cerca de 70 Kcal por cada 100 gramas. É rico em magnésio e potássio e deve ser salgado manter a sua conservação. O bacalhau é demolhado e a seguir cozinha-se no forno, na frigideira, na brasa ou simplesmente cozido em água.

Em Portugal, existem 1001 maneiras de cozinhar bacalhau, umas mais tradicionais outras mais criativas. Os portugueses adoram e consomem o bacalhau em qualquer ponto do país.

Segundo a Dona Dolores, Bacalhau à Brás é um dos pratos preferidos do seu filho e melhor jogador do mundo Cristiano Ronaldo."
category_service = "Meal"
price_cents = 12

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'bacalhau.jpg', content_type: 'image/jpg')
service.save!

# #  6th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/feijoada_p9f7fr.jpg')
name_service = "Feijoada tradicional"
description_service = "DescriçãoFeijoada é uma designação comum dada a pratos da culinária de regiões e países lusófonos como Portugal, Brasil, Angola, Moçambique, Timor-Leste e Macau. Consiste num guisado de feijão, normalmente com carne, e quase sempre acompanhado com arroz."
category_service = "Meal"
price_cents = 15

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'feijoada.jpg', content_type: 'image/jpg')
service.save!

# # 7th service Meal

file = URI.open('https://res.cloudinary.com/djx2n26vg/image/upload/v1583322867/ButlerX/InesHotel/ovos_k4ecyj.jpg')
name_service = "Ovos mexidos"
description_service = "Ovos mexidos é um prato de culinária feito a partir de ovos de galinha. Os ovos são mexidos e vertidos numa frigideira quente, usualmente untada com gordura e mexidos com um utensílio de cozinha, até começarem a coagular. Este é um prato conhecido e usado no mundo inteiro."
category_service = "Meal"
price_cents = 10

service = Service.new(name: name_service, description: description_service, category: category_service, price: price_cents, hotel: user)
service.photo.attach(io: file, filename: 'ovos.jpg', content_type: 'image/jpg')
service.save!



puts "Done! F to the Yeah!"

booking = Booking.new(check_in: Date.parse('2020-03-04'), check_out: Date.parse('2020-03-20'), booking_number: '2662823182', hotel: user, guest: user2)
booking.save!

chat_room = ChatRoom.create!(name: "Customer Support", booking_id: booking.id)
message = Message.new(content: "Hi! Welcome to our establishment. Anything you need don't hesitate to get in touch with us. Hope you enjoy your stay.",
  chat_room_id: chat_room.id, user_id: user.id)
message.save!
