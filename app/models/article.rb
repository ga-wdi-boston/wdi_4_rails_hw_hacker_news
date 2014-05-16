class Article < ActiveRecord::Base
  validates :title, :url, presence: true
  has_many :comments
  belongs_to :user
  has_many :votes, as: :voteable
end
