class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  validates! :user, :likeable, presence: true
  validates! :user_id, uniqueness: { scope: [:likeable_id, :likeable_type] }

  def self.order_by_score(likeables)
    likeables.sort_by { |likeable| score(likeable) }.reverse
  end

  def self.score(likeable)
    likeable.likes.where(is_upvote: true).count - likeable.likes.where(is_upvote: false).count
  end

end
