# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article, :class => 'Articles' do
    title "MyString"
    url "MyString"
  end
end
