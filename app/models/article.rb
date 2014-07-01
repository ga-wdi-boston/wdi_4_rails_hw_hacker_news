class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
end
