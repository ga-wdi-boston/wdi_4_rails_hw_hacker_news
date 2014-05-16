class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :votes, :as => :votable

  validates :title, presence: true
  validates :url, format: { with: URI.regexp }
end
