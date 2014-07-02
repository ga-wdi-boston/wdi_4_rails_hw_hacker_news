class Comment < ActiveRecord::Base
  belongs_to :users, :articles
  belongs_to :votable, polymorphic: true
end
