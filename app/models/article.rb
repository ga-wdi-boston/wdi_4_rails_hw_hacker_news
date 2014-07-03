class Article < ActiveRecord::Base
  include VoteCounter
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  validates! :user, presence: true
  validates_presence_of :url, :title
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :url, format: {with: VALID_URL_REGEX, message: "is not properly formed"}

end
