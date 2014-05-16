# articles = create_list(:article, 1)
# logins = create_list(:user, 1)

FactoryGirl.define do
  factory :article do
    title { Faker::Name.title }
    url { Faker::Internet.url }
  end

  # factory :user do
  #   email { Faker::Internet.email }
  #   password { Faker::Internet.password(8) }
  # end

end

