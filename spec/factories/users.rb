# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { "#{Faker::Name.first_name}@example.com" }
    password "password"
  end
end
