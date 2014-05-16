require 'spec_helper'

feature 'User submits new comment' do
  background do
    visit comments_path
    click_link 'Add Comment'
  end

  scenario 'successfully' do

    fill_in 'Title', with: 'Amazing Article'
    fill_in 'Body', with: 'I will repost this article on my twitter account'
    click_button 'Add Comment'

    expect(page).to have_content 'Comment successfully added!'
    expect(page).to have_content 'Amazing Article'
    expect(page).to have_content 'I will repost this article on my twitter account'
  end

  scenario 'unsucessfully due to required fields being blank' do
  click_button 'Add Comment'

  expect(page).to have_content "Body can't be blank"
  end

end
