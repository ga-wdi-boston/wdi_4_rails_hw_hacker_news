User.delete_all
Article.delete_all

admin = User.create!(email: 'plesko.l@gmail.com', password: 'password')

puts 'Creating Articles'
33.times do |i|
  article = Article.create!(title: Faker::Lorem.words(rand(1..4)).join(' '), url: Faker::Internet.url)
  admin.articles << article
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
