require 'faker'

# Create users
User.destroy_all
Tipper.destroy_all
Tippee.destroy_all
Tip.destroy_all

5.times do
  user = User.create(full_name: Faker::Name.name,
              email: Faker::Internet.email, 
              username: Faker::Internet.user_name,  
              password: Faker::Internet.password(8),
              image_url: Faker::Avatar.image,
              balance: rand(2..10),
              terms_version: "1.0")
  Tipper.create(user_id: user.id, standard_tip_amount: rand(0.01..0.2))
end

5.times do
  user = User.create(full_name: Faker::Name.name,
              email: Faker::Internet.email, 
              username: Faker::Internet.user_name,  
              password: Faker::Internet.password(8),
              image_url: Faker::Avatar.image,
              balance: rand(2..10),
              terms_version: "1.0")
  Tippee.create(user_id: user.id)
end

10.times do
  user = User.create(full_name: Faker::Name.name,
              email: Faker::Internet.email, 
              username: Faker::Internet.user_name,  
              password: Faker::Internet.password(8),
              image_url: Faker::Avatar.image,
              balance: rand(2..10),
              terms_version: "1.0")
  Tipper.create(user_id: user.id, standard_tip_amount: rand(0.01..0.2))
  Tippee.create(user_id: user.id)
end

User.create(full_name: "Suzie the Swan", email: "s@swan.sw", username: "suzie", 
  password: "qwerty123", 
  image_url: "http://www.birdclipart.com/bird_clipart_images/clip_art_illustration_of_a_cartoon_swan_wearing_a_princess_crown_0521-1102-0723-5716_SMU.jpg" ,
  balance: rand(3..10),
  terms_version: "1.0")

User.create(full_name: "Dolly the Duck", email: "d@duck.dk", username: "dolly", 
  password: "qwerty123", 
  image_url: "http://www.drawingcoach.com/image-files/cartoon_ducks_st5.jpg",
  balance: rand(3..10),
  terms_version: "1.0")

User.create(full_name: "Harry the horse", email: "h@horse.ho", username: "harry", 
  password: "qwerty123",
  image_url: "http://www.cliparthut.com/clip-arts/1425/cartoon-horse-clip-art-1425785.png",
  balance: rand(3..10), 
  terms_version: "1.0")

tippee_array = Tippee.pluck(:id)
tipper_array = Tipper.pluck(:id)

20.times do
  Tip.create(tipper_id: tipper_array.sample, 
              tippee_id: tippee_array.sample,
              url: Faker::Internet.url,
              amount: rand(0.01..0.1)
              )
end




