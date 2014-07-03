# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password "password"
  end

  factory :article do
    title { Faker::Company.bs }
    url { Faker::Internet.url }
    user
  end

end
