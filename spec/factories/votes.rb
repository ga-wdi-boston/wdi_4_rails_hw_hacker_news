# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    upvote false
    neutralvote false
    downvote false
    voteable_id 1
    voteable_type "MyString"
  end
end
