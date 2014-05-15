require 'spec_helper'

feature 'User submits article' do
  background do
    visit root_path
    click_link 'New Article'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Sample Article'
    fill_in 'Url', with: 'http://samplearticle.com'
    click_button 'Submit Article'

    expect(page).to have_content 'Article successfully submitted'
    expect(page).to have_content 'Sample Article'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Submit Article'

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'unsuccessfully due to invalid url' do
    fill_in 'Title', with: 'Sample Article'
    fill_in 'Url', with: 'samplearticle.com'
    click_button 'Submit Article'

    expect(page).to have_content "invalid"
  end
end
