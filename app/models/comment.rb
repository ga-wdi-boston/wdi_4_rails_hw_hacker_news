class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :articles
  belongs_to :votable, polymorphic: true
end
