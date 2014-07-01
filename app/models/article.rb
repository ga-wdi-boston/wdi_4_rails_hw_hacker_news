class Article < ActiveRecord::Base

  validates :title, presence: true

  validates :url, presence: true

  # VALID_URL = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  # validates :url, format: { with: VALID_URL }

end
