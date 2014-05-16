FactoryGirl.define do
  #Creates a factory for article class in the model
  factory :article do
    url { Faker::Internet.url }
    title { Faker::Company.name }
  end
end

