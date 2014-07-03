require 'rails_helper'

feature 'User creates an account' do
  background do
    visit root_path
  end

  scenario 'successfully' do

    click_link "Sign up"
    fill_in 'Email', with: "devin@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'

    expect(page).to have_content "Logged in as devin@example.com"
    expect(page).to have_content "signed up successfully"

  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_link "Sign up"
    click_button 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"

  end
end
