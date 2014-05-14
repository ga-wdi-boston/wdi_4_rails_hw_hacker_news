class Article < ActiveRecord::Base
  has_many :comments

  validates :title, presence: true

  validates_format_of :url, with: URI.regexp
end
