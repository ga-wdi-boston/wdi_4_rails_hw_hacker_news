#Article Seeds!
require 'faker'

seed_articles=10

seed_articles.times do
  Article.create!(title: Faker::Lorem.sentence, url: Faker::Internet.url,
    submitted_on: rand(30.days).ago)
end
