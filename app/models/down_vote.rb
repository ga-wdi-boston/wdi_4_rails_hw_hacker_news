class DownVote <ActiveRecord::Base
  belongs_to :user
  belongs_to :down_voteable, polymorphic:true
end
