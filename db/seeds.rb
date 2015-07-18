User.delete_all
Article.delete_all
Comment.delete_all
Vote.delete_all

max = User.create!(email: 'max@test.com', password: 'password')
chase = User.create!(email: 'chase@test.com', password: 'password')

article1 = Article.create!(title: 'ESPN', url: 'http://www.espn.com', user_id: max.id)
article2 = Article.create!(title: 'Grantland', url: 'http://www.grantland.com', user_id: chase.id)
article3 = Article.create!(title: 'Facebook', url: 'http://www.facebook.com', user_id: max.id)
article4 = Article.create!(title: 'Twitter', url: 'http://www.twitter.com', user_id: max.id)
article5 = Article.create!(title: 'FanGraphs', url: 'http://www.fangraphs.com', user_id: chase.id)
article6 = Article.create!(title: 'BBC News', url: 'http://www.bbc.co.uk', user_id: chase.id)
article7 = Article.create!(title: 'Mashable', url: 'http://www.mashable.com', user_id: max.id)
article8 = Article.create!(title: 'GangGreenNation', url: 'http://www.ganggreennation.com', user_id: max.id)

comment1 = Comment.create!(body: 'This is a cool site!', user_id: chase.id, article_id: article1.id)
comment2 = Comment.create!(body: 'I know right? Everything is fantastic. ', user_id: max.id, article_id: article1.id)
