require_relative 'voting'

# Represents a comment to a news article
class Comment < ActiveRecord::Base
  include Voting

  belongs_to :user
  belongs_to :article
  has_many :votes, as: :voteable, dependent: :destroy

  validates :user, :article, :body, presence: true
end
