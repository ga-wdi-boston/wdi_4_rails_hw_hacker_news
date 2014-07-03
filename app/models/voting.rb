module Voting

  def points
    upvotes - downvotes
  end

  def upvotes
    self.votes.where(vote: 'upvote').count
  end

  def downvotes
    self.votes.where(vote: 'downvote').count
  end
end
