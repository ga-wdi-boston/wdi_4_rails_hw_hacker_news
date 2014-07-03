require 'rails_helper'

feature 'User submits comment' do
  background do
    @devin = create(:user, email: "devin@example.com")
    @devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    visit root_path
  end

  scenario 'successfully' do
    sign_in_as(@devin)
    click_link "comments"


    click_link "Add Comment"
    fill_in "Body", with: "This is a comment"
    click_button "Add Comment"

    expect(page).to have_content "Posted comment"
  end

  scenario 'unsuccessfully not signed in' do
    click_link "comments"

    click_link "Add Comment"

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  scenario 'unsuccessfully due to required fields being blank' do
    sign_in_as(@devin)
    click_link "comments"

    click_link "Add Comment"
    click_button "Add Comment"

    expect(page).to have_content "Body can't be blank"
  end
end
