require 'spec_helper'

feature 'User creates comments' do
  scenario 'successfully on an article' do
    articles = create_list(:article, 1)
    visit root_path

    # save_and_open_page
    click_link 'Comment'
    fill_in 'Body', with: 'This is a great article'
    click_button 'Submit Comment'

    expect(page).to have_content 'Comment received'
  end
end
