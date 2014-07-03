class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :likes, as: :likeable
  validates! :user, :article, presence: true
  validates :content, presence: true
end
