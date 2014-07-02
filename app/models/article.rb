class Article < ActiveRecord::Base
  belongs_to :users
  has_many :comments, as: votable
  belongs_to :votable, polymorphic: true
end
