class Article < ActiveRecord::Base

  has_many :comments
  belongs_to :user
  has_many :votes, as: :voteable

end
