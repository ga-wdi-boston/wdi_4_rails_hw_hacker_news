class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy

  def upvote_for(upvoteable)
    upvoteable.upvotes.find_by(user_id: id)
  end

  def downvote_for(downvoteable)
    downvoteable.downvotes.find_by(user_id: id)
  end

end
