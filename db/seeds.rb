Article.delete_all
User.delete_all

jill =  User.create!(email: 'jill@example.com', password: 'password', username: 'jillster')
fred =  User.create!(email: 'fred@example.com', password: 'password', username: 'freddy boy')
mort =  User.create!(email: 'mort@example.com', password: 'password', username: 'mortifI')
tom = User.create!(email: 'tom@example.com', password: 'oohlalas', username: 'TomTom')


jill.articles.create!(title: 'imgur', url: 'http://imgur.com')
fred.articles.create!(title: 'facebook', url: 'http://facebook.com')
fred.articles.create!(title: 'news', url: 'http://news.google.com')
tom.articles.create!(title: 'sports', url: 'http://espn.com')
mort.articles.create!(title: 'sunscreen', url: 'http://coppertone.com')
