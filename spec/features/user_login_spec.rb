require 'spec_helper'

feature 'User logs into website' do
  background do
    User.create!(email: 'plesko.l@gmail.com', password: 'password')
    visit root_path
    click_link 'Login'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'plesko.l@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Sign in'

    expect(page).to have_content "Invalid email or password"
  end
end
