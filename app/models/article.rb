class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :title, :url, presence: true
  validates :url, :format => URI::regexp(%w(http https))
end
