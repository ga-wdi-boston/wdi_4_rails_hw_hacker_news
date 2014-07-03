class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  belongs_to :votable, polymorphic: true

  def vote_count
    @article_id = self.id
    # @votes = Vote.where(votable_id: @article_id)
    @upvotes = Vote.where(votable_id: @article_id, value: 'upvote')
    @downvotes = Vote.where(votable_id: @article_id, value: 'downvote')
    @score = (@upvotes.count) - (@downvotes.count)

    @score
  end
end
