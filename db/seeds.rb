Article.delete_all
Comment.delete_all
User.delete_all

user1 = User.create(email: 'tom@example.com', password: 'password')
user2 = User.create(email: 'dick@example.com', password: 'password')
user3 = User.create(email: 'harry@example.com', password: 'password')
user4 = User.create(email: 'meghan@example.com', password: 'password')
user5 = User.create(email: 'sue@example.com', password: 'password')
user6 = User.create(email: 'steviedog@example.com', password: 'password')

article1 = Article.create(title: 'TEST1Sharable analyzing model', url:'http://erdman.org/letha.romaguera', created_at:'2014-05-11 02:52:04 UTC')
article2 = Article.create(title: 'Distributed coherent array', url:'http://lynchwehner.com/aurelia', created_at:'2014-05-13 02:52:19 UTC')
article3 = Article.create(title: 'Persistent local concept', url:'http://bradtke.name/cornelius', created_at:'2014-05-13 02:52:24 UTC')
article4 = Article.create(title: 'Programmable demand-driven Graphical User Interface', url:'http://fayrunolfsdottir.org/cydney.bogisich', created_at:'2014-05-13 02:52:31 UTC')
article5 = Article.create(title: 'Innovative coherent project', url:'http://leannonschamberger.org/leonora', created_at:'2014-05-13 02:52:31 UTC')
article6 = Article.create(title: 'TEST FINAL Go time!', url:'http://gotime.com', created_at:'2014-05-13 03:35:47 UTC')
article7 = Article.create(title: 'Yet another!', url:'http://onemore.com', created_at:'2014-05-14 03:35:47 UTC')

comment01 = Comment.create(message: 'TEST1 Non est minima sunt.', created_at:'2014-05-14 02:52:04 UTC')
comment02 = Comment.create(message: 'Recusandae itaque et et.', created_at:'2014-05-14 02:52:04 UTC')
comment03 = Comment.create(message: 'Est animi vel corrupti maxime aut.', created_at:'2014-05-15 02:52:04 UTC')
comment04 = Comment.create(message: 'Aspernatur quod a libero fugit facilis voluptatem natus ad.', created_at:'2014-05-15 02:52:04 UTC')
comment05 = Comment.create(message: 'Quae odio sed voluptatem eum dolor cum.', created_at:'2014-05-16 02:52:04 UTC')
comment06 = Comment.create(message: 'Magni non et et sunt occaecati quia ut.', created_at:'2014-05-16 02:52:04 UTC')
comment07 = Comment.create(message: 'Fuga sapiente atque est reiciendis sunt aut cum.', created_at:'2014-05-17 02:52:04 UTC')
comment08 = Comment.create(message: 'Dolorem ad pariatur aliquam quod temporibus iusto.', created_at:'2014-05-17 02:52:04 UTC')
comment09 = Comment.create(message: 'Non quo accusantium sint.', created_at:'2014-05-18 02:52:04 UTC')
comment10 = Comment.create(message: 'Rerum assumenda enim quibusdam minus quo dignissimos rem autem.', created_at:'2014-05-19 02:52:04 UTC')
comment11 = Comment.create(message: 'Nisi est quo ut qui occaecati dolorem natus minus.', created_at:'2014-05-19 02:52:04 UTC')
comment12 = Comment.create(message: 'Placeat et exercitationem nihil asperiores dolor delectus.', created_at:'2014-05-20 02:52:04 UTC')

article1.comments << comment01 << comment05
article2.comments << comment04 << comment10
article3.comments << comment03 << comment09
article5.comments << comment02 << comment06 << comment07 << comment08 << comment11 << comment12

user1.articles << article1 << article3 << article7
user2.articles << article5
user4.articles << article2 << article4
user5.articles << article6

user1.comments << comment01 << comment03
user2.comments << comment02
user3.comments << comment04 << comment07 << comment10 << comment11
user4.comments << comment05 << comment08
user6.comments << comment09 << comment06 << comment12

