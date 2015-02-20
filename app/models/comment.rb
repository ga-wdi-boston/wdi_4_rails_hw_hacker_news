class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy

  validates! :user, :article, presence: true
  validates :content, presence: true

  def score
    votes.map(&:value).reduce(0, &:+)
  end

end
