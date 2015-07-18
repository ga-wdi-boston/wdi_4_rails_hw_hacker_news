# Represents an upvote or downvote
class Vote < ActiveRecord::Base
  VOTE_TYPE = %w(upvote downvote)

  belongs_to :user
  belongs_to :voteable, polymorphic: true

  # Throws an error if the user or voteable is null
  validates! :user_id, uniqueness: { scope: [:voteable_id, :voteable_type] }
  validates :vote, inclusion: { in: VOTE_TYPE }
end
