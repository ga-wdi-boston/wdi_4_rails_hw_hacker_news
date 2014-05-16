class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :votes, as: :votable

  def score
    self.votes.sum(:value)
  end
end
