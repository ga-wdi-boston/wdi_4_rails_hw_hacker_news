require 'rails_helper'

feature 'User links to articles' do
  scenario 'on the front page' do

    devin = create(:user, email: "devin@example.com")
    devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    devin.articles.create!(title: "Rails Documentation", url: "http://api.rubyonrails.org/")

    visit root_path
    click_link "Ruby on Rails Guides"

    expect(current_url).to have_content "http://guides.rubyonrails.org/"

  end
end
