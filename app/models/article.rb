class Article < ActiveRecord::Base

  validates :title, presence: true

  validates :url, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  # VALID_URL = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  # validates :url, format: { with: VALID_URL }

end
