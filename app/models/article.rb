class Article < ActiveRecord::Base
  belongs_to :user
  before_create :set_submission_time
  validates_presence_of :url, :title
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :url, format: {with: VALID_URL_REGEX, message: "is not properly formed"}


  def set_submission_time
    self.submitted_at = Time.now
  end

end
