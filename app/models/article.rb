class Article < ActiveRecord::Base

  has_many :comments
  belongs_to :user
  has_many :votes, as: :voteable

  def points
    return 0 if votes.empty?
    votes.map(&:score).reduce(:+)
  end

end
