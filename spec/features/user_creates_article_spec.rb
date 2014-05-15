require 'spec_helper'

feature 'User creates article' do
  background do
    visit root_path
    click_link 'New Article'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Things and stuff but mostly stuff'
    fill_in 'URL', with: 'http://www.stuffandthings.com'

    click_button 'Create Article'

    expect(page).to have_content 'Article successfully created'

  end

  scenario 'unsuccessfully due to required fields missing' do
    click_button 'Create Article'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Url can't be blank"

  end
end
