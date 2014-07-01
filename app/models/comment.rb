class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates! :user, :article, presence: true
  validates :content, presence: true

end
