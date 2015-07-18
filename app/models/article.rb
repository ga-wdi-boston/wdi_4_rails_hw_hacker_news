class Article < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true

  has_many :votes, as: :voteable
  has_many :comments
  belongs_to :user


end
