class Article < ActiveRecord::Base
  has_many :comments
  has_many :votes, as: :voteable

  def rating
    @article.votes.score.sum
  end


end
