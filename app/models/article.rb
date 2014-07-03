class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :votable, polymorphic: true
end
