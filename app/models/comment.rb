class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :article
  belongs_to :user
end
