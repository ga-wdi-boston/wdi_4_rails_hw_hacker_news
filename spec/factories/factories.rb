require 'faker'

FactoryGirl.define do
  factory :article do
    title { Faker::Internet.domain_name }
    url { Faker::Internet.url }
    created_at { rand(90).days.ago }
  end
end

FactoryGirl.define do
  factory :comment do
    title { Faker::Lorem.sentence(3, true, 4) }
    body { Faker::Lorem.paragraph(2) }
    submission_date { rand(60).days.ago }
  end
end
