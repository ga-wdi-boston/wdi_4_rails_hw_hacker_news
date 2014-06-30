class Article < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, format: {with: /\Ahttp:\/\//}
end
