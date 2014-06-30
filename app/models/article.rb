class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :url, format: { with: /\Ahttp/ }
end
