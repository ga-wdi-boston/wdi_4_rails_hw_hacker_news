class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :votes, as: :voteable, dependent: :destroy
  validates! :user, presence: true
  validates :body, presence: true

end
