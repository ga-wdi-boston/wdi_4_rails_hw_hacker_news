class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :votable, polymorphic: true

  def vote_count
    @comment_id = self.id
    # @votes = Vote.where(votable_id: @article_id)
    @upvotes = Vote.where(votable_id: @comment_id, value: 'upvote')
    @downvotes = Vote.where(votable_id: @comment_id, value: 'downvote')
    @score = (@upvotes.count) - (@downvotes.count)

    self.vote_score = @score

    @score
  end
end
