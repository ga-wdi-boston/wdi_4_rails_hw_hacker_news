#Article Seeds!
require 'faker'

Article.delete_all
User.delete_all
Comment.delete_all


u1 = User.create!(email: 'fred@example.com', password: 'password')
u2 = User.create!(email: 'george@example.com', password: 'password')

a = Article.create!(user: u1, url: 'http://generalassemb.ly', title: 'General Assembly', submitted_on: 2.days.ago)
b = Article.create!(user: u2, url: 'http://guides.rubyonrails.org', title: 'Rails Guides', submitted_on: 4.days.ago)
c = Article.create!(user: u2, url: 'http://api.rubyonrails.org', title: 'Rails API Documentation', submitted_on: 5.days.ago)
Article.create!(user: u1, url: 'http://xkcd.com', title: 'Nerd Joke Central', submitted_on: 9.days.ago)

c.comments.create!(user: u1, content: "Test Comment with some content")
b.comments.create!(user: u1, content: "Another test with different content")
a.comments.create!(user: u2, content: "A new challenger approaches with a Comment")
a.comments.create!(user: u1, content: "I sure do post a lot of Commentes")
b.comments.create!(user: u2, content: "Second user posts things less often")
c.comments.create!(user: u2, content: "Vague and inspiring quotation or somesuch")
