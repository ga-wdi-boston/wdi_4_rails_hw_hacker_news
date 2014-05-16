# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

count = 0

articles = FactoryGirl.create_list(:article, 10)
comments = FactoryGirl.create_list(:comment, 30)

3.times do
  articles.each do |article|
    article.comments << comments[count]
    count += 1
  end
end



