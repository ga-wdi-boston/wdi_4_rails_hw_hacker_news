# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.delete_all
Article.delete_all
User.delete_all

# Users
devin = User.create!(
  email: "devin@example.com",
  password: "password"
)

users = FactoryGirl::create_list(:user, 10)

# Articles
rails = devin.articles.create!(
  title: "Ruby on Rails Guides",
  url: "http://guides.rubyonrails.org/"
)

doc = devin.articles.create!(
  title: "Rails Documentation",
  url: "http://api.rubyonrails.org/"
)

cap = devin.articles.create!(
  title: "CAP Theorem: Explained",
  url: "http://robertgreiner.com/2014/06/cap-theorem-explained/"
)

js = devin.articles.create!(
  title: "An Introduction To Full-Stack JavaScript",
  url: "http://www.smashingmagazine.com/2013/11/21/introduction-to-full-stack-javascript/"
)

frameworks = devin.articles.create!(
  title: "Angular, Ember, And Backbone: Which JavaScript Framework Is Right For You?",
  url: "http://readwrite.com/2014/02/06/angular-backbone-ember-best-javascript-framework-for-you#awesm=~oIlDDgJzjmlbSG"
)

html = devin.articles.create!(
  title: "Mozilla Developer Network: HTML",
  url: "https://developer.mozilla.org/en-US/docs/Web/HTML"
)

css = devin.articles.create!(
  title: "Mozilla Developer Network: CSS",
  url: "https://developer.mozilla.org/en-US/docs/Web/CSS"
)

hackathon = devin.articles.create!(
  title: "Travel and Education Hackathon",
  url: "https://www.eventbrite.com/e/travel-education-hackathon-tickets-11993939195?discount=GA20"
)

events = devin.articles.create!(
  title: "galvanize events",
  url: "http://www.galvanize.it/events/"
)

meetup = devin.articles.create!(
  title: "Denver Ruby Meetup",
  url: "http://www.meetup.com/Denver-rb/"
)

# Comments
articles = [rails, doc, cap, js, frameworks, html, css, hackathon, events, meetup]

articles.each do |article|
  (rand(10) + 1).times do
    article.comments.create!(body: "This is a comment by #{users[rand(10)].email}", user_id: rand(11) + 1)
  end
end

# Votes
users.each do |user|
  articles.each do |article|
    article.votes.create!(user_id: user.id, is_up: %w(true false).sample)

    article.comments.each do |comment|
      comment.votes.create!(user_id: user.id, is_up: %w(true false).sample)
    end
  end
end

