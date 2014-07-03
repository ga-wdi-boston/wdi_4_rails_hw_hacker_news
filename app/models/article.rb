class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :upvotes, as: :upvoteable, dependent: :destroy
  has_many :downvotes, as: :downvoteable, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end
