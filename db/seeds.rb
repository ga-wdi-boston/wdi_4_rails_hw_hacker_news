# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all
Comment.delete_all

user = User.first

a1 = Article.create(title: 'Newegg is now accepting Bitcoin',
  url: 'http://promotions.newegg.com/nepro/14-3540/index.html',
  user_id: user.id,
  submitted_at: Time.now.getutc)

a2 = Article.create(title: 'Cicada 3301',
  url: 'https://en.wikipedia.org/wiki/Cicada_3301',
  user_id: user.id,
  submitted_at: Time.now.getutc)

a3 = Article.create(title: 'The new 501(c)(3) and the future of free software in the U.S',
  url: 'http://blogs.gnome.org/jnelson/2014/06/30/the-new-501c3-and-the-future-of-free-software-in-the-united-states/',
  user_id: user.id,
  submitted_at: Time.now.getutc)

a4 = Article.create(title: 'Piketty in R markdown',
  url: 'http://simplystatistics.org/2014/06/30/piketty-in-r-markdown-we-need-some-help-from-the-crowd/',
  user_id: user.id,
  submitted_at: Time.now.getutc)

a5 = Article.create(title: '  A 30-minute Introduction to Rust',
  url: 'http://doc.rust-lang.org/master/intro.html',
  user_id: user.id,
  submitted_at: Time.now.getutc)
