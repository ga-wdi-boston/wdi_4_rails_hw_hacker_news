require 'spec_helper'

feature 'User creates comment' do
  background do
    visit articles_path
    click_link 'New Comment'
  end

  scenario 'successfully' do
    fill_in 'Comment', with: 'FIRST LOL'
    fill_in 'Author', with: 'joe@example.com'

    click_button 'Create Comment'

    expect(page).to have_content 'Comment successfully created'

  end
end
