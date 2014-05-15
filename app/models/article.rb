class Article < ActiveRecord::Base
  validates :title, :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
