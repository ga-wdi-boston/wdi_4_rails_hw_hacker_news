require 'rails_helper'

feature 'User logs out of account' do
  background do
    create(:user, email: "devin@example.com")
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "devin@example.com"
    fill_in 'Password', with: "password"
    click_button 'Sign in'
  end

  scenario 'successfully' do

    click_link "Logout"

    expect(page).to have_content "Signed out successfully"

  end
end
