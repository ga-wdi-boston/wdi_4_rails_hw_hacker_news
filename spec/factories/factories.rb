FactoryGirl.define do
  factory :article do
    title { Faker::Name.title }
    url { Faker::Internet.url }
  end

end
