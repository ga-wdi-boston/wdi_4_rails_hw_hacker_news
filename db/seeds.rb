# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all
Comment.delete_all

article1 = Article.create!(title: 'title1', url: 'www.test1.com')
article2 = Article.create!(title: 'title2', url: 'www.test2.com')
article3 = Article.create!(title: 'title3', url: 'www.test3.com')
article4 = Article.create!(title: 'title4', url: 'www.test4.com')
article5 = Article.create!(title: 'title5', url: 'www.test5.com')

article1.comments.create!(body: 'comment 1')
article2.comments.create!(body: 'comment 2')
article3.comments.create!(body: 'comment 3')
article4.comments.create!(body: 'comment 4')
article4.comments.create!(body: 'comment 5')
article5.comments.create!(body: 'comment 6')
