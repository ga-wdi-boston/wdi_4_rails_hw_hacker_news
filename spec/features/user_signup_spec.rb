require 'spec_helper'

feature 'User registers for website' do
  background do
    visit root_path
    click_link 'Sign up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'plesko.l@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Sign up'

    expect(page).to have_content "blank"
  end


end






