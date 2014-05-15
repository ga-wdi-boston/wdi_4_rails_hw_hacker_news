class Comment < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :article
end
