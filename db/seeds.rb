# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all
Comment.delete_all
User.delete_all

u1 = User.create!(email: 'fred@example.com', password: 'password')
u2 = User.create!(email: 'george@example.com', password: 'password')

article = Article.create(
  url: "http://www.crunchbase.com/",
  title: "crunchbase"
  )

article.comments.create!(body: 'Good article!', user_id: 1)
article.comments.create!(body: 'Nice!', user_id: 1)


Article.create(
  url: "http://techcrunch.com/",
  title: "techcrunch")

Article.create(
  url: "http://www.tumblr.com/",
  title: "tumblr")

Article.create(
  url: "http://beenos.com/",
  title: "BEENOS")

Article.create(
  url: "http://www.reddit.com/",
  title: "reddit")


