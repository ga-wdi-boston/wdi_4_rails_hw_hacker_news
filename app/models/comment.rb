# Represents a comment to a news article
class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy

  validates :user, :article, :body, presence: true
end
