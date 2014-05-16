class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :managed_articles
  has_many :articles, through: :managed_articles

  has_many :managed_comments
  has_many :comments, through: :managed_comments
end
