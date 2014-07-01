class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def host
    URI(@url).host
  end

  def list_score
    if comments.empty?
      '0 points'
    else
      'TODO!!!'
    end
  end

  def list_comment_count
    if comments.empty?
      'discuss'
    else
      "#{comments.size} comments"
    end
  end

  validates :title, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https))
end
