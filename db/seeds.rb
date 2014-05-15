# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.create!(
  title: "So... I filmed strawberry growing (40 days in ~15 seconds)",
  url: "http://i.imgur.com/ReboQ1W.gif")

Article.create!(
  title: "How to fix racism",
  url: "http://i.imgur.com/btIZin9.jpg")

Article.create!(
  title: "Dropbox Webhooks",
  url: "https://www.dropbox.com/developers/blog/90/announcing-dropbox-webhooks")
