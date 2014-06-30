class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :url , format: {:with => /https?:\/\/[\S]+/}

  has_many :songs, dependent: :destroy
end
