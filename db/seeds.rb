# Create users
User.destroy_all
Tipper.destroy_all
Tippee.destroy_all
Tip.destroy_all
Follow.destroy_all

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
  image_url: "https://www.birdclipart.com/bird_clipart_images/clip_art_illustration_of_a_cartoon_swan_wearing_a_princess_crown_0521-1102-0723-5716_SMU.jpg" ,
  balance: rand(3..10),
  terms_version: "1.0")

User.create(full_name: "Dolly the Duck", email: "d@duck.dk", username: "dolly",
  password: "qwerty123",
  image_url: "https://www.drawingcoach.com/image-files/cartoon_ducks_st5.jpg",
  balance: rand(3..10),
  terms_version: "1.0")

User.create(full_name: "Harry the horse", email: "h@horse.ho", username: "harry",
  password: "qwerty123",
  image_url: "https://www.cliparthut.com/clip-arts/1425/cartoon-horse-clip-art-1425785.png",
  balance: rand(3..10),
  terms_version: "1.0")

user_array = User.pluck(:id)
tippee_array = Tippee.pluck(:id)
tipper_array = Tipper.pluck(:id)

random_urls = [
  "https://www.youtube.com/watch?v=cDaepLDC0oE",
  "https://www.youtube.com/watch?v=Xs5IMWjI1SA",
  # "https://music.quietentertainer.com/track/walkie-talkie-irn-mnky-beat-down-mix",
  "https://www.youtube.com/watch?v=uR_8JuIXvpA",
  "https://www.youtube.com/watch?v=_T2XcE9UhWI",
  "https://www.pinterest.com/pin/53832158023475798/",
  "https://www.pinterest.com/pin/269301252694607860/",
  "https://www.pinterest.com/pin/546483736011610386/",
  "https://www.pinterest.com/pin/301811612506221942/",
  # "https://www.stuff.co.nz/national/quizzes/daily-quizzes/12236967/Afternoon-trivia-quiz-July-20",
  "https://djshadow.bandcamp.com/releases/",
  # "https://www.stuff.co.nz/national/quizzes/12230614/Daily-trivia-quiz-July-20",
  # "https://www.stuff.co.nz/auckland/local-news/manukau-courier/69876532/unusual-baggage-seized-at-border",
  "https://soundcloud.com/beatkingkong-clubgod-amen/going-down-beatking-dirty",
  "https://soundcloud.com/beatteamsupreme/jnthn-stein-true",
  "https://soundcloud.com/sandpeoplecologne/sandpeople-x-made-in-m-bypassed",
  "https://stackoverflow.com/questions/31511191/when-open-emoji-keyboard-uitextview-goes-up",
  "https://stackoverflow.com/questions/31511195/import-scope-and-specify-path",
  "https://stackoverflow.com/questions/31511196/does-web-scraping-have-patterns",
  "https://stackoverflow.com/questions/31511112/c-sharp-named-pipes-in-message-mode-sometimes-merge-messages",
  "https://stackoverflow.com/questions/31511200/looking-for-a-daydeal-plugin-with-custom-sorting-functionality",
  "http://www.expressnews.com/news/education/article/Texas-textbook-standards-on-Civil-War-concern-6377518.php",
  "http://www.ctvnews.ca/canada/man-who-survived-lightning-strike-wins-1m-jackpot-with-co-worker-1.2478542#",
  "http://www.cbc.ca/passionateeye/episodes//apples-broken-promises",
  "https://www.minds.com/blog/view/468466376596533248/new-co2-recycler-captures-carbon-dioxide-from-the-atmosphere-and-turns-it-back-into-fuel"
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

# Our stuff after here

te = User.create(full_name: "Te Aihe Butler", email: "teaihe@team.squad", username: "Te",
  password: "qwerty123",
  image_url: "https://avatars3.githubusercontent.com/u/9012942?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

liz = User.create(full_name: "Liz McKoy", email: "liz@team.squad", username: "Liz",
  password: "qwerty123",
  image_url: "https://avatars0.githubusercontent.com/u/11071977?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

kyle = User.create(full_name: "Kyle Black Snow", email: "kyle@team.squad", username: "Kyle",
  password: "qwerty123",
  image_url: "https://avatars2.githubusercontent.com/u/11069001?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

kelly = User.create(full_name: "Kelly Munro", email: "kelly@team.squad", username: "Kelly",
  password: "qwerty123",
  image_url: "https://avatars2.githubusercontent.com/u/11514966?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

will = User.create(full_name: "Will Sklenars", email: "will@team.squad", username: "Will",
  password: "qwerty123",
  image_url: "https://avatars2.githubusercontent.com/u/11266273?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

rhys = User.create(full_name: "Rhys Portegys", email: "rhys@team.squad", username: "Rhys",
  password: "qwerty123",
  image_url: "https://avatars0.githubusercontent.com/u/11514884?v=3&s=460",
  balance: rand(3..10),
  terms_version: "1.0")

tieke = [te,liz,kyle,kelly,will,rhys]

tieke.each do | member |
  Tipper.create(user_id: member.id)
  Tippee.create(user_id: member.id)
  user_array.each do | user_id | 
    Follow.create(followed_id: member.id , following_id: user_id)    
  end
end

