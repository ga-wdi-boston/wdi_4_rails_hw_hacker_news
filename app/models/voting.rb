module Voting

  def points
    weighted_votes(upvotes) - weighted_votes(downvotes)
  end

  def upvotes
    self.votes.where(vote: 'upvote')
  end

  def downvotes
    self.votes.where(vote: 'downvote')
  end

  private

  def weighted_votes(votes)
    now = Time.now.getutc
    result = 0
    votes.each do |vote|
      result += 1 ** ( 1 - (vote.created_at.to_time.utc.to_f / now.to_f))
    end
    result.round
  end
end
