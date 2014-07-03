require 'rails_helper'

feature 'User views articles' do
  background do
    @devin = create(:user, email: "devin@example.com")
    @rails = @devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    @doc = @devin.articles.create!(title: "Rails Documentation", url: "http://api.rubyonrails.org/")
  end

  scenario 'on the front page' do

    visit root_path

    expect(page).to have_content "Ruby on Rails Guides"
    expect(page).to have_content "Rails Documentation"

  end
end
