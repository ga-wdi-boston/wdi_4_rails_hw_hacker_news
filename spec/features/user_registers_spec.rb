require 'spec_helper'

# I can't get this to work T_T
feature 'User registers' do
  background do
    visit root_path
    click_link 'Sign up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'joe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'

  end

  scenario 'unsuccessfully due to required fields missing' do
    click_button 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"

  end
end
