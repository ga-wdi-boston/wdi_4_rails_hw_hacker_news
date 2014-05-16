FactoryGirl.define do
  factory :article do
    title { Faker::Company.catch_phrase }
    url { Faker::Internet.url }
  end
end


FactoryGirl.define do
  factory :comment do
    message { Faker::Lorem.sentence }
  end
end
