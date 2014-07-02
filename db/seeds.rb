User.delete_all
Article.delete_all

u1 = User.create!(email: 'fred@example.com', password: 'password')
u2 = User.create!(email: 'george@example.com', password: 'password')


Article.create!(user: u1, title: "A Short Field Guide To Finding Designers", body: "As someone with a hybrid designer/developer profile, I end up hanging out with a lot of developers and entrepreneurs. And when the conversation turns to finding talent, sooner or later someone will point out just how hard it is to find designers. It’s as if designers were elusive beasts, hiding in the deepest, most remote jungles. Of course, that’s not quite true. There are plenty of places where designer congregate in plain sight, such as Dribbble, Behance, or Designer News.")
Article.create!(user: u1, title: "The Most And Least Walkable Cities In The U.S", body: "Walkable cities aren't only good for avid pedestrians. They also have a higher GDP per capita and higher education levels than metropolitan areas that are harder to navigate on foot, according to a new report. Foot Traffic Ahead: Ranking Walkable Urbanism in America's Largest Metros, a report from the Center for Real Estate and Urban Analysis at George Washington University School of Business and Smart Growth America, ranks the 30 largest U.S. metro areas based on how many 'walkable urban places' they have.")
Article.create!(user: u2, title: "Alan Turing's reading list – what the godfather of modern computing borrowed from his school library", body: "“You are a mashup of what you let into your life,” it’s been said. Since creativity is combinatorial, the architecture of mind and character is deeply influenced by the intellectual stimulation we choose to engage with — including the books we read. There is hardly anything more fascinating than the private intellectual diet of genius — like this recently uncovered list of books computing pioneer and early codehacker Alan Turing borrowed from his school library. Though heavy on the sciences, the selection features some wonderful wildcards that bespeak the cross-disciplinary curiosity fundamental to true innovation. A few personal favorites follow.")
Article.create!(user: u1, title: "Woman posts ad for herself as Professional Bridesmaid on Craigslist", body: "When all my friends started getting engaged - I decided to make new friends. So I did - but then they got engaged also and for what felt like the hundredth time, I was asked to be a bridesmaid. This year alone, i've been a bridesmaid 4 times. That's 4 different chiffon dresses, 4 different bachelorette parties filled with tequila shots and guys in thong underwear twerking way too close to my face, 4 different pre-wedding pep talks to the bride about how this is the happiest day of her life and marriage, probably, is just like riding a bike: a little shaky at first but then she'll get the hang of it.")
Article.create!(user: u2, title: "10 must-own boob-themed clothes, accessories, home décor + more", body: "Keep on 'Free(ing) the Nipple' with this handprinted and handsewn tote.")
Article.create!(user: u2, title: "Infographic: See which luxury brands Jay Z shouted out the most per album", body: "Listening to Jay Z's latest album is like hearing a very bass-heavy, syllabically symmetric recitation of the Neiman Marcus Christmas book. It's a fleeting glimpse at a level of opulence far beyond what most people dare to imagine for themselves. It's also the culmination of some long-simmering aspirations.")




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
