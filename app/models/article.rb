class Article < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :title, presence: true
  validates :url, presence: true, format: {with: /\Ahttp:\/\//}

  def score
    votes.map(&:value).reduce(0, &:+)
  end

end
