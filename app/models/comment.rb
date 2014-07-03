class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  has_many :points, as: :pointable, dependent: :destroy

  # validates :user, :commentable, :text_box, presence: true


end
