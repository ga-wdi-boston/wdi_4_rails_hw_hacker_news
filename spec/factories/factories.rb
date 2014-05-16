FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence(3, true, 4) }
    url { Faker::Internet.url }
  end
end
