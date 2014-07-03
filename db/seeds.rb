# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Article.delete_all

eric = User.create!(email: 'eric.rho.87@gmail.com', password: 'password')
mike = User.create!(email: 'mike.rotch.77@gmail.com', password: 'password')
stalin = User.create!(email: 'captain.mustache@soviet.union', password: 'TrustHitler')

reddit = Article.create!(title: 'Consumer of Lives', url: 'http://www.reddit.com')
screen = Article.create!(title: 'My Favourite Site For Movie News', url: 'http://www.screenrant.com')
jets = Article.create!(title: 'J-E-T-S JETS JETS JETS', url: 'http://www.jetnation.com/')
