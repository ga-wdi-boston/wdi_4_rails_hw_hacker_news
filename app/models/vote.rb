class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true
  validates :user_id, :vote, presence: true
  validates :vote, :inclusion => {:in => [-1,1]}
end
