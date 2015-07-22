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


random_urls = [
  "https://www.youtube.com/watch?v=cDaepLDC0oE",
  "https://www.youtube.com/watch?v=Xs5IMWjI1SA",
  "http://music.quietentertainer.com/track/walkie-talkie-irn-mnky-beat-down-mix",
  "https://www.youtube.com/watch?v=uR_8JuIXvpA",
  "https://www.youtube.com/watch?v=_T2XcE9UhWI",
  "https://www.pinterest.com/pin/53832158023475798/",
  "https://www.pinterest.com/pin/269301252694607860/",
  "https://www.pinterest.com/pin/546483736011610386/",
  "https://www.pinterest.com/pin/301811612506221942/",
  "http://www.stuff.co.nz/national/quizzes/daily-quizzes/12236967/Afternoon-trivia-quiz-July-20",
  "http://djshadow.bandcamp.com/releases/",
  "http://www.stuff.co.nz/national/quizzes/12230614/Daily-trivia-quiz-July-20",
  "http://www.stuff.co.nz/auckland/local-news/manukau-courier/69876532/unusual-baggage-seized-at-border",
  "https://soundcloud.com/beatkingkong-clubgod-amen/going-down-beatking-dirty",
  "https://soundcloud.com/beatteamsupreme/jnthn-stein-true",
  "https://soundcloud.com/sandpeoplecologne/sandpeople-x-made-in-m-bypassed",
  "http://stackoverflow.com/questions/31511191/when-open-emoji-keyboard-uitextview-goes-up",
  "http://stackoverflow.com/questions/31511195/import-scope-and-specify-path",
  "http://stackoverflow.com/questions/31511196/does-web-scraping-have-patterns",
  "http://stackoverflow.com/questions/31511112/c-sharp-named-pipes-in-message-mode-sometimes-merge-messages",
  "http://stackoverflow.com/questions/31511200/looking-for-a-daydeal-plugin-with-custom-sorting-functionality"
].shuffle


20.times do | i |
  link = random_urls[i]
  object = LinkThumbnailer.generate(link)
  Tip.create(tipper_id: tipper_array.sample,
              tippee_id: tippee_array.sample,
              url: link,
              amount: rand(0.01..0.1),
              link_title: object.title,
              link_thumbnail: object.images.first.src.to_s,
              link_description: object.description
  )
end

