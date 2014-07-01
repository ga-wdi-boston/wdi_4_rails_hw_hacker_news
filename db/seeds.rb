# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all

article1 = Article.create(title: 'title1', url: 'www.test1.com', submitted_at: '01-01-2001')
article2 = Article.create(title: 'title2', url: 'www.test2.com', submitted_at: '01-02-2001')
article3 = Article.create(title: 'title3', url: 'www.test3.com', submitted_at: '01-03-2001')
article4 = Article.create(title: 'title4', url: 'www.test4.com', submitted_at: '01-04-2001')
article5 = Article.create(title: 'title5', url: 'www.test5.com', submitted_at: '01-05-2001')
