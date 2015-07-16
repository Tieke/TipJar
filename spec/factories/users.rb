FactoryGirl.define do
  factory :user do
    username "freddythefrog"
    full_name "Freddy the Frog"
    terms_version "0.1"
    terms_date Time.now
    admin false
    image_url "http://www.firstgroup.com/ukbus/assets/images/midlands/freddie.jpg"
    balance 10
    email "freddy@example.com"
    password "test1234"
  end
end
