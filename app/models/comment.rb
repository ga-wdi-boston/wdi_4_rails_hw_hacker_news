class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates! :user, :article, presence: true
  validates :content, presence: true
end
