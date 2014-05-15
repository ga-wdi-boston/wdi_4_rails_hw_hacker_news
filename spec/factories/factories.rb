FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence(5) }
    url { Faker::Internet.url }
  end
end
