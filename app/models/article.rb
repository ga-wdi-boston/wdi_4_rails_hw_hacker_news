class Article < ActiveRecord::Base
  belongs_to :users
  has_many :comments
  belongs_to :votable, polymorphic: true
end
