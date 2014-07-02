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
user1.articles.create!(url: "http://www.google.com", title: "Awesome search engine")
user2.articles.create!(url: "http://www.reddit.com/r/ruby", title: "Ruby Subreddit")
user4.articles.create!(url: "http://www.hackernews.com", title: "The OG hacker news")

# Comments
Comment.create!(body: "Duh, it's google", user_id: 3, article_id: 1)
Comment.create!(body: "le repost", user_id: 4, article_id: 2)
Comment.create!(body: "clearly the superior site", user_id: 2, article_id: 3)
Comment.create!(body: "I like this place more", user_id: 1, article_id: 3)


# Votes
