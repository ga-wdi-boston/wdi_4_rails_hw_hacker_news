# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    direction false
    votable_id 1
    votable_type "MyString"
    user nil
  end
end
