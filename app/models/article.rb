class Article < ActiveRecord::Base
  validates :title, :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))

  has_many :comments
  belongs_to :user
end
