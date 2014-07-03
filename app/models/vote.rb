class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true
  validates :user, :votable, :vote, presence: true
end
