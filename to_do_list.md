SPECS
- users exist -- yep
- articles exist -- yep
- articles have:
  url -- yep
  title -- yep
  timestamp -- yep
  belongs_to: user -- yep
- signed in users can create articles
- front page displays links to articles
- signed in users can leave comments
- top-level only
- comments have:
  text
  timestamp
  belongs_to: article
- votes exist
- signed-in users can up/downvote articles and comments
- one vote per user per thing
- you can change your vote
- articles and comments sorted by score
- put it on heroku
