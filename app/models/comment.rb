class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :article
  belongs_to :user

  has_many :votes, dependent: :destroy

end
