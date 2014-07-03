class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy

  validates :title, presence: true
  validates :url, :format => URI::regexp(%w(http https))

  def points
    return 0 if votes.empty?
    votes.map(&:score).reduce(:+)
  end

end
