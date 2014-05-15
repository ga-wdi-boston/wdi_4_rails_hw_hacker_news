class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :url, format: { with: URI.regexp }
end
