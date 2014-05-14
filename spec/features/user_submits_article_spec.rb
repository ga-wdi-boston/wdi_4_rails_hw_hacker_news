require 'spec_helper'

feature 'User submits new article' do
  background do
    visit root_path
    click_link 'Add Article'
  end

  scenario 'successfully' do

    fill_in 'Title', with: 'Google'
    fill_in 'Url', with: 'http://www.google.com'
    click_button 'Add Article'

    expect(page).to have_content 'Article successfully added!'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'http://www.google.com'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Add Article'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Url can't be blank"
  end



end
