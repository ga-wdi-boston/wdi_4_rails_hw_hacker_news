require 'faker'

FactoryGirl.define do
  factory :article do
    title { Faker::Internet.domain_name }
    url { Faker::Internet.url }
    created_at { rand(90).days.ago }
  end
end
