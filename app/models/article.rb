class Article < ActiveRecord::Base
  validates :title, :url, presence: true
end
