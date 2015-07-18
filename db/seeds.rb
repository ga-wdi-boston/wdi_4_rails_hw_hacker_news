# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
user1 = User.create!(email: 'jake@example.com', password: 'password')
user2 = User.create!(email: 'steve@example.com', password: 'password')
user3 = User.create!(email: 'mark@example.com', password: 'password')
user4 = User.create!(email: 'tom@example.com', password: 'password')
user5 = User.create!(email: 'alex@example.com', password: 'password')

# Articles
art1 = user1.articles.create!(url: "http://www.google.com", title: "Awesome search engine")
art2 = user2.articles.create!(url: "http://www.reddit.com/r/ruby", title: "Ruby Subreddit")
art3 = user4.articles.create!(url: "http://www.hackernews.com", title: "The OG hacker news")

40.times do
  user1.articles.create!(url: Faker::Internet.url, title: Faker::Company.bs)
end
# Comments
com1 = art1.comments.create!(body: "Duh, it's google", user_id: 3)
com2 = art2.comments.create!(body: "le repost", user_id: 4)
com3 = art3.comments.create!(body: "clearly the superior site", user_id: 2)
com4 = art3.comments.create!(body: "I like this place more", user_id: 1)


#  Votes
art1.votes.create!(upvote: true, user_id: 3)
art1.votes.create!(upvote: true, user_id: 2)
art1.votes.create!(upvote: false, user_id: 4)
art2.votes.create!(upvote: true, user_id: 1)
art2.votes.create!(upvote: true, user_id: 5)
art2.votes.create!(upvote: true, user_id: 2)
art3.votes.create!(upvote: false, user_id: 3)
art3.votes.create!(upvote: false, user_id: 1)
art3.votes.create!(upvote: false, user_id: 2)

com1.votes.create!(upvote: true, user_id: 1)
com1.votes.create!(upvote: true, user_id: 2)
com1.votes.create!(upvote: true, user_id: 3)
com1.votes.create!(upvote: true, user_id: 4)
com2.votes.create!(upvote: true, user_id: 5)
com2.votes.create!(upvote: false, user_id: 1)
com2.votes.create!(upvote: false, user_id: 2)
com2.votes.create!(upvote: false, user_id: 3)
com3.votes.create!(upvote: true, user_id: 4)
com3.votes.create!(upvote: true, user_id: 5)
com3.votes.create!(upvote: true, user_id: 1)
com3.votes.create!(upvote: false, user_id: 2)
com4.votes.create!(upvote: false, user_id: 3)
com4.votes.create!(upvote: false, user_id: 4)
com4.votes.create!(upvote: false, user_id: 5)
com4.votes.create!(upvote: false, user_id: 1)
