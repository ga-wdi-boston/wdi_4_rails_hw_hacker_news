class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  def vote_for(votable)
    votable.votes.find_by(user_id: id)
  end

end
