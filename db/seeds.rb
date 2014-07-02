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
Vote.delete_all

jill = User.create(email: 'jill@example.com', password: 'password')
tom = User.create(email: 'tom@example.com', password: 'password')
alex = User.create(email: 'alex@example.com', password: 'password')
dave = User.create(email: 'dave@example.com', password: 'password')

a1 = Article.create(title: 'Newegg is now accepting Bitcoin',
  url: 'http://promotions.newegg.com/nepro/14-3540/index.html',
  user_id: jill.id,
  submitted_at: Time.now.getutc)

a2 = Article.create(title: 'Cicada 3301',
  url: 'https://en.wikipedia.org/wiki/Cicada_3301',
  user_id: tom.id,
  submitted_at: Time.now.getutc)

a3 = Article.create(title: 'The new 501(c)(3) and the future of free software in the U.S',
  url: 'http://blogs.gnome.org/jnelson/2014/06/30/the-new-501c3-and-the-future-of-free-software-in-the-united-states/',
  user_id: alex.id,
  submitted_at: Time.now.getutc)

a4 = Article.create(title: 'Piketty in R markdown',
  url: 'http://simplystatistics.org/2014/06/30/piketty-in-r-markdown-we-need-some-help-from-the-crowd/',
  user_id: dave.id,
  submitted_at: Time.now.getutc)

a5 = Article.create(title: '  A 30-minute Introduction to Rust',
  url: 'http://doc.rust-lang.org/master/intro.html',
  user_id: tom.id,
  submitted_at: Time.now.getutc)

c1 = Comment.new(body: 'Some random comment', user_id: tom.id)
a1.comments << c1
a1.save

c2 = Comment.new(body: 'Somthing random', user_id: dave.id)
a2.comments << c2
a2.save

c3 = Comment.new(body: 'Something completely off-topic', user_id: alex.id)
a1.comments << c3
a1.save

c4 = Comment.new(body: 'Not meaningful', user_id: jill.id)
a3.comments << c4
a3.save

c5 = Comment.new(body: 'Foo', user_id: tom.id)
a3.comments << c5
a3.save

