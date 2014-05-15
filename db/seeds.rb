Article.delete_all

puts 'Creating Articles'

33.times do |i|
  Article.create!( title: Faker::Internet.domain_name, url: Faker::Internet.url, created_at: rand(90).days.ago )
  end
