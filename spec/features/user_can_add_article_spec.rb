require 'spec_helper'

feature 'User can add a new article' do
  scenario 'successfully' do
    visit articles_path

    click_link 'New Article'
    fill_in 'Title', with: 'Solar Powered Phone'
    fill_in 'Url', with: 'http://inhabitat.com/samsung-releases-solar-powered-phone/'
    click_button 'Create Article'

    save_and_open_page

    expect(page).to have_content 'Article successfully created!'
    expect(page).to have_content 'Solar Powered Phone'
  end
end
