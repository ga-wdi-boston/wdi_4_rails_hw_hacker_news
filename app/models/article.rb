class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, format:{:with => /https?:\/\/[\S]+/}

  has_many :comments, dependent: :destroy
  belongs_to :user
end
