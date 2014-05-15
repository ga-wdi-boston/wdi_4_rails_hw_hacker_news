class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, presence: true

  validates_format_of :url, with: URI.regexp
end
