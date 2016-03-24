# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    title "MyString"
    body "MyText"
    user_id nil
  end
end
