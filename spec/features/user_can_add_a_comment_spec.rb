require 'spec_helper'

feature 'User can comment on an article' do
  scenario 'successfully' do
    visit articles_path

    click_link 'New Article'
    fill_in 'Title', with: 'Solar Powered Phone'
    fill_in 'Url', with: 'http://inhabitat.com/samsung-releases-solar-powered-phone/'
    click_button 'Create Article'

    click_link 'Comment'
    fill_in 'Comments', with: 'It worked!'
    click_button 'Create Comment'

    expect(page).to have_content 'Comment successfully created!'
    expect(page).to have_content 'It worked!'
  end
end
