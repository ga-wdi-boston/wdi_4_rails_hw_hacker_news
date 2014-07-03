class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic:true
  has_many :votes, as: :voteable, dependent: :destroy
  has_many :down_votes, as: :down_voteable, dependent: :destroy


  validates :content, presence:true
end
