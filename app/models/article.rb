require 'uri'
require_relative 'voting'

# Represents a news article
class Article < ActiveRecord::Base
  include Voting

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  def host
    URI(self.url).host
  end

  def score
    points = compute_votes
    return "#{points} point" if points == 1
    "#{points} points"
  end

  def comment_count
    if self.comments.empty?
      'discuss'
    else
      "#{comments.size} comments"
    end
  end

  private

  def compute_votes
    points = self.points
    comments.each { |e| points += e.points }
    points
  end

  validates :user, :title, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
end
