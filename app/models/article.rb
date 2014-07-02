class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, format:{:with => /https?:\/\/[\S]+/}

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
end
