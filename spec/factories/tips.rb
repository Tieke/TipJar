FactoryGirl.define do
  factory :tip do
    url 'www.google.com'
    amount 0.01
    message "Awesome photo"
    tippee
    tipper
  end

end
