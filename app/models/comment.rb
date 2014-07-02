class Comment < ActiveRecord::Base
  # belongs_to :article, :user

  # #look for _type AND _id to find this
  # belongs_to :commentable, polymorphic: true
  # has_many :likes, as: :likeable, dependent: :destroy

  # validates :user, :commentable, :text_box, presence: true


end
