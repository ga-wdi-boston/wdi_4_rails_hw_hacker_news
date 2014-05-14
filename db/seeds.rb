
# Article 1 with 2 comments
article = Article.create(title: "Passwords for JetBlue accounts cannot contain a Q or a Z", url: "http://www.jetblue.com")
comment = Comment.create(body: "Wow, crazy stuff!")

article.comments << comment

comment = Comment.create(body: "Passwords are awesome!")

article.comments << comment

# Article 2 with 2 comments

article = Article.create(title: "Octotree: the missing GitHub tree view (Chrome extension)", url: "http://www.chrome.google.com")
comment = Comment.create(body: "missing trees view")

article.comments << comment

comment = Comment.create(body: "I was wondering why that was happening")

article.comments << comment
