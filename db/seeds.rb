# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a1 = Article.create!(
  title: "So... I filmed strawberry growing (40 days in ~15 seconds)",
  url: "http://i.imgur.com/ReboQ1W.gif")

Article.create!(
  title: "How to fix racism",
  url: "http://i.imgur.com/btIZin9.jpg")

Article.create!(
  title: "Dropbox Webhooks",
  url: "http://robots.thoughtbot.com/whats-the-deal-with-rails-polymorphic-associations")

Article.create!(
  title: "Why You Don’t Need Has_and_belongs_to_many Relationships",
  url: "http://blog.flatironschool.com/post/35346328762/why-you-dont-need-has-and-belongs-to-many")

Article.create!(
  title: "Shoot to kill; CSS selector intent",
  url: "http://csswizardry.com/2012/07/shoot-to-kill-css-selector-intent/")

a1.comments << Comment.new(content: "Awesome")
