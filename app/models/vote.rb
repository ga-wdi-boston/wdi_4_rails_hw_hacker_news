class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates! :user_id, uniqueness: { scope: [ :voteable_id, :voteable_type ] }
  validates :score, inclusion: { in: [1, -1] }
end
