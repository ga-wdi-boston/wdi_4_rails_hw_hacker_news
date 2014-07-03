require 'rails_helper'

feature 'User submits article' do
  scenario 'successfully' do
    devin = create(:user, email: "devin@example.com")
    visit root_path
    sign_in_as(devin)

    click_link "Submit Article"
    fill_in "Title", with: "Ruby on Rails Guides"
    fill_in "Url", with: "http://guides.rubyonrails.org/"
    click_button "Submit Article"

    expect(page).to have_content "Posted"
  end

  scenario 'unsuccessfully not signed in' do
    visit root_path

    click_link "Submit Article"

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  scenario 'unsuccessfully due to required fields being blank' do
    devin = create(:user, email: "devin@example.com")
    visit root_path
    sign_in_as(devin)

    click_link "Submit Article"
    click_button "Submit Article"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Url is invalid"
  end
end
