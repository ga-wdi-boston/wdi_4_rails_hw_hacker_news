Article.delete_all

puts 'Creating Articles'

20.times do |i|
  Article.create!( title: Faker::Internet.domain_name, url: Faker::Internet.url, created_at: rand(90).days.ago )
  end


Comment.delete_all

puts 'Creating Comments'

35.times do |i|
  Comment.create!( title: Faker::Lorem.sentence(3, true, 4), body: Faker::Lorem.paragraph(2), submission_date: rand(60).days.ago )
  end
