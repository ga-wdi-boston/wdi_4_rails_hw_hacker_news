require 'rails_helper'

feature 'User views article comments' do
  scenario 'by clicking on comments link' do

    devin = create(:user, email: "devin@example.com")
    rails = devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    rails.comments.create!(body: "This is a comment on the ruby on rails guides article.")
    visit root_path

    click_link "comments"

    expect(page).to have_content "This is a comment on the ruby on rails guides article."

  end
end
