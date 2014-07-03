class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :article
  belongs_to :user

  has_many :votes, as: :votable,  dependent: :destroy

end
