class User < ActiveRecord::Base

  # articles this user has created
  has_many :articles

  # join table named article_comment that has a user_id and a comment_id
  # comments are on a specific article
  has_many :comments
  # articles this user has commented on.


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
