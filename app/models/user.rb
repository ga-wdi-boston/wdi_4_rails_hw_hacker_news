# Represents a user of the news system
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  # Returns the user's vote for the given voteable, or nil if no
  # vote has been cast. This method caches the user's vote, if it exists,
  # along with the given voteable to minimize repeated database calls.
  def get_vote(voteable)
    if @voteable != voteable
      @voteable = voteable
      @vote = voteable.votes.find_by_user_id(self.id)
    end
    @vote
  end
end
