class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :votes, dependent: :nullify

  def vote_for(voteable)
    voteable.votes.find_by(user_id: id)
  end

end
