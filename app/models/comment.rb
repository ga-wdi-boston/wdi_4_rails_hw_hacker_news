class Comment < ActiveRecord::Base
  validates :body, presence: true
  has_many :votes, as: :voteable
  belongs_to :user
  belongs_to :article
end
