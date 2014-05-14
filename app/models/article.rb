class Article < ActiveRecord::Base
  has_many :comments

  validates :title, presence: true
  validates :url, format: { with: URI.regexp }
end
