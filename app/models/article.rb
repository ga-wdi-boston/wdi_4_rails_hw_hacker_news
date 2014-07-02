require 'uri'

# Represents a news article
class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  def host
    URI(self.url).host
  end

  def list_score
    if self.comments.empty?
      '0 points'
    else
      'TODO!!!'
    end
  end

  def list_comment_count
    if self.comments.empty?
      'discuss'
    else
      "#{comments.size} comments"
    end
  end

  validates :user, :title, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
end
