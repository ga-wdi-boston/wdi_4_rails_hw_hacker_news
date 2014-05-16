class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :votes, :as => :votable

  validates :body, presence: true
end
