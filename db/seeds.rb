User.delete_all
Article.delete_all

fred = User.create!(email: 'fred@example.com', password: 'password')
marie = User.create!(email: 'marie@example.com', password: 'password')

Article.create!(user: fred, url: 'http://en.wikipedia.org/wiki/Hackers_(film)', title: 'Hackers Info', created_at: 2.days.ago)
Article.create!(user: marie, url: 'http://en.wikipedia.org/wiki/Hacker_News', title: 'Hacker News (not news)', created_at: 4.days.ago)
Article.create!(user: marie, url: 'http://www.theonion.com/', title: 'Actual News', created_at: 5.days.ago)
Article.create!(user: fred, url: 'http://www.rottentomatoes.com/m/hackers/', title: 'Hackers Reviews', created_at: 9.days.ago)
