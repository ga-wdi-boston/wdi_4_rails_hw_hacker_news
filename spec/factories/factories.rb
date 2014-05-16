FactoryGirl.define do

  factory :article do
    title { Faker::Company.bs }
    url { Faker::Internet.url }
  end
end
