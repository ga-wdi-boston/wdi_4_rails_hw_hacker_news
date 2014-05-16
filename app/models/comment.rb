class Comment < ActiveRecord::Base
  belongs_to :article
  has_many :user_comments
  has_many :users, through: :user_comments
  has_many :votes, as: :voteable

  def rating
    @comment.votes.score.sum
  end
end
