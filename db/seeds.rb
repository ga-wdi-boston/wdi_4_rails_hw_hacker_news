User.delete_all
Article.delete_all
Comment.delete_all

user1 = User.create!(email: 'plesko.l@gmail.com', password: 'password')
article1 = user1.articles.create!(title: 'Poof and then Rails was gone', url: 'http://patmaddox.com/2014/05/15/poof-and-then-rails-was-gone/')
comment1 = article1.comments.create!(body: 'This is terrible! I just spent all this time learning Rails!', user: user1)

user2 = User.create!(email: 'fred@gmail.com', password: 'password')
article2 = user1.articles.create!(title: 'The Economics of a Kickstarter Project', url: 'https://medium.com/@cameronmoll/5b374cfeb43c')
comment2 = article2.comments.create!(body: "Let's kickstart the world!")






# puts 'Creating Articles'
# 33.times do |i|
#   article = Article.create!(title: Faker::Lorem.words(rand(1..4)).join(' '), url: Faker::Internet.url)
#   admin.articles << article
# end

# comment = Comment.create!(body: 'This was a great article!')
# article.comments << comment
# admin.comments << comment





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
