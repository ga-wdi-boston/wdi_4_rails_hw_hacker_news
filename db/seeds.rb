# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Article.delete_all

devin = User.create!(
  email: "devin@example.com",
  password: "password"
)

devin.articles.create!(
  title: "Ruby on Rails Guides",
  url: "http://guides.rubyonrails.org/"
)

devin.articles.create!(
  title: "Rails Documentation",
  url: "http://api.rubyonrails.org/"
)

devin.articles.create!(
  title: "CAP Theorem: Explained",
  url: "http://robertgreiner.com/2014/06/cap-theorem-explained/"
)

devin.articles.create!(
  title: "An Introduction To Full-Stack JavaScript",
  url: "http://www.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/"
)

devin.articles.create!(
  title: "Angular, Ember, And Backbone: Which JavaScript Framework Is Right For You?",
  url: "http://readwrite.com/2014/02/06/angular-backbone-ember-best-javascript-framework-for-you#awesm=~oIlDDgJzjmlbSG"
)
