module VoteCounter

  def vote_count
    upvotes - downvotes
  end

  def upvotes
    self.votes.where(upvote: true).count
  end

  def downvotes
    self.votes.where(upvote: false).count
  end


end
