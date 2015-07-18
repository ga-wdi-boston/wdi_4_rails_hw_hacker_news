class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  has_many :down_votes, as: :down_voteable, dependent: :destroy

  validates :title, presence:true
  validates :url, presence:true

  validates! :user, presence:true

end
