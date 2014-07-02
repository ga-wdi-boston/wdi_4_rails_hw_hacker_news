class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :title, presence: true
  validates :url, format: { with: /\Ahttp/ }
  # validates! :user_id, presence: true

  def score
    score = 0
    self.votes.each do |vote|
      score += vote.is_up ? +1 : -1
    end
    score
  end
end
