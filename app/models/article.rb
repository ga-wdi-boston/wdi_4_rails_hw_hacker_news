class Article < ActiveRecord::Base
  validates :url, :format => URI::regexp(%w(http https))
  validates :url, :title, presence: true
end
