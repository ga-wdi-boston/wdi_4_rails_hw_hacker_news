class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates! :user, presence: true
  validates :url, :title, presence: true
  validates :url, format: { with: /\Ahttp/ }
end
