class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy

  validates :body, presence: true
  # validates! :user_id, :article_id, presence: true

  def score
    score = 0
    self.votes.each do |vote|
      score += vote.is_up ? +1 : -1
    end
    score
  end
end
