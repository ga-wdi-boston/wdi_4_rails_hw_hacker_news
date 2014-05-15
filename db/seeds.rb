User.delete_all
Article.delete_all

# Create Users
puts 'Creating users...'
kathleen = User.create(email: "kvotolato3@gmail.com", password: "12345678")
vilmos = User.create(email: "vilmos@mingspring.com", password: "csizmadia")
joe = User.create(email: "joe@example.com", password: "12345678")
kathy = User.create(email: "kathy@example.com", password: "12345678")

puts 'Creating articles and comments'

# Article 1 with 2 comments
article = Article.create(title: "Passwords for JetBlue accounts cannot contain a Q or a Z", url: "http://www.jetblue.com")
kathleen.articles << article

article.comments.create(body: "Wow, crazy stuff!", user: vilmos)
article.comments.create(body: "Passwords are awesome!", user: joe)


# Article 2 with 2 comments

article = Article.create(title: "Octotree: the missing GitHub tree view (Chrome extension)", url: "http://chrome.google.com")
kathy.articles << article

article.comments.create(body: "missing trees view", user: kathleen)
article.comments.create(body: "I was wondering why that was happening", user: joe)


# Article 3 with 2 comments

article = Article.create(title: "Your Face and Name Will Appear in Google Ads Starting Today", url: "http://www.gizmodo.com")
joe.articles << article

article.comments.create(body: "your face...and your name too!", user: kathleen)
article.comments.create(body: "today, what?", user: kathy)

