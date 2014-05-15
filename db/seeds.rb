article1 = Article.create!(title: 'Pharmaceutical Industry Reeling As More Moms Making Vaccines At Home', url: 'http://www.theonion.com/articles/pharmaceutical-industry-reeling-as-more-moms-makin,36028/')

article2 = Article.create!(title: 'McDonald’s Janitor', url: 'http://www.theonion.com/articles/mcdonalds-janitor-would-like-to-thank-everyone-who,36029/')

ethan = User.create!(email: 'ethan@example.com', password: 'password')
boomer = User.create!(email: 'boomer@example.com', password: 'password')

puts "articles inserting"
ethan.articles << article1
boomer.articles << article2
