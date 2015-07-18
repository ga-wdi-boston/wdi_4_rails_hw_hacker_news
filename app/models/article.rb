class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  validates :url, presence: true
  validates! :user, presence: true

  def self.order_by_score(articles)
    articles.sort_by { |article| article.score }.reverse
  end

  def score
    self.likes.where(is_upvote: true).count - self.likes.where(is_upvote: false).count
  end
end
