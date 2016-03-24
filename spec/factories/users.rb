# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "jonny"
    email "jonny@example.com"
    password "example8"
    password_confirmation "example8"
    add1 "22"
  	street "acacai avenue"
  	town "Ztown"
  	country "United Kingdom"
  	postcode "SW19 2BZ"
  end
end
