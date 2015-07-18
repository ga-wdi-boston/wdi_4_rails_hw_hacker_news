# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Article.delete_all
Comment.delete_all

zack = User.create!(email: 'zack@zack.com', password: 'password')
ollie = User.create!(email: 'ollie@ollie.com', password: 'password')
jon = User.create!(email: 'jon@jon.com', password: 'password')

a1 = Article.create!(user: zack, title: 'politics', url: 'http://nytimes.com', created_at: 1.hour.ago)
a2 = Article.create!(user: ollie, title: 'sports', url: 'http://espn.com', created_at: 2.days.ago)
a3 = Article.create!(user: zack, title: 'food', url: 'http://seriouseats.com', created_at: 2.hours.ago)
a4 = Article.create!(user: ollie, title: 'facebook', url: 'http://facebook.com', created_at: 1.year.ago)

Comment.create!(user: jon, article: a1, body: 'republicans are so stupid', created_at: 2.hours.ago)
Comment.create!(user: ollie, article: a1, body: 'no democrats are so stupid', created_at: 1.hour.ago)
Comment.create!(user: zack, article: a1, body: 'troll', created_at: 2.minutes.ago)
Comment.create!(user: jon, article: a2, body: 'go knicks', created_at: 35.minutes.ago)
Comment.create!(user: jon, article: a4, body: 'hanging out with the boys', created_at: 2.years.ago)
Comment.create!(user: jon, article: a4, body: 'look at my new car', created_at: 24.days.ago)
Comment.create!(user: ollie, article: a4, body: 'clown question bro', created_at: 2.minutes.ago)
Comment.create!(user: ollie, article: a4, body: 'learn how to spell', created_at: 5.hours.ago)
