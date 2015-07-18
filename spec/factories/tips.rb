FactoryGirl.define do
  factory :tip do
    url "http://www.firstgroup.com/ukbus/assets/images/midlands/test.jpg"
    amount 0.01
    message "Awesome photo"
    tippee
    tipper
  end

end
