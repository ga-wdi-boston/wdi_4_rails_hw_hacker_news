Article.delete_all
Comment.delete_all
puts 'Creating Articles'

20.times do |i|
  Article.create!( title: Faker::Internet.domain_name, url: Faker::Internet.url, created_at: rand(90).days.ago )
  end


article1 = Article.find(1)
article2 = Article.find(2)
article3 = Article.find(3)



puts 'Creating Comments'

35.times do |i|
  Comment.create!( title: Faker::Lorem.sentence(3, true, 4), body: Faker::Lorem.paragraph(2), submission_date: rand(60).days.ago )
  end

comment1 = Comment.find(1)
comment2 = Comment.find(2)
comment3 = Comment.find(3)
comment4 = Comment.find(4)
comment5 = Comment.find(5)
comment6 = Comment.find(6)
comment7 = Comment.find(7)
comment8 = Comment.find(8)
comment9 = Comment.find(9)
comment10 = Comment.find(10)

article1.comments << comment1 << comment4 << comment7 << comment9 << comment10
article2.comments << comment2 << comment5 << comment8
article3.comments << comment3 << comment6
