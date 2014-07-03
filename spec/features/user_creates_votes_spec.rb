require 'rails_helper'

feature 'User creates a vote' do
  scenario 'on an article' do
    visit root_path
    article = Article.new(url: 'http://www.google.com', title: 'Google')
    # save_and_open_page
    click_link 'Upvote'
    expect(page).to have_content text: '1 Upvote'
  end

end
