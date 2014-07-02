# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Article.delete_all
Comment.delete_all

article_1 = Article.create(user_name: "hackthawrld", url: 'http://animagraffs.com/', title: 'Jet Engines')
# article_1.comments.create!(text_box: 'jet engines are so cool!', user_name: 'popeye')
# article_1.comments.create!(text_box: 'i could make one in my garage', user_name: 'totofortootoo')
# article_1.comments.create!(text_box: 'how much does a football stadium cost?', user_name: 'lollipopGuild')

article_2 = Article.create(user_name: "hungryeyez", url: 'http://www.forbes.com/sites/womenintech/2012/06/04/women-in-tech-debates-paying-respect-to-the-real-issues-at-hand-with-a-bit-of-journalistic-integrity/', title: 'Debate of Gender Politics in Tech Continues')
# article_2.comments.create!(text_box: 'so sick of sexism. just. everywhere', user_name: 'StealthLion')

article_3 = Article.create(user_name: "ghandigirl", url: 'https://www.ted.com/talks/sugata_mitra_build_a_school_in_the_cloud', title: 'Build a School in the Cloud')
# article_3.comments.create!(text_box: ' education is the way to grow', user_name: '99percent')
# article_3.comments.create!(text_box: 'where are these kids gonna ge jobs?', user_name: 'realist')
