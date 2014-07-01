class Vote < ActiveRecord::Base
  UP_OR_DOWN = [-1, 1]

  belongs_to :voteable
  belongs_to :user

  validates! :user, :voteable, presence: true
  validates :value, inclusion: {in: UP_OR_DOWN }

end
