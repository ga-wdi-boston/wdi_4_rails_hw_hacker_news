class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true

  validates_format_of :url, with: URI.regexp

  def score
    self.votes.sum(:value)
  end
end
