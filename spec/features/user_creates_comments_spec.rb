require 'spec_helper'

feature 'User creates comments' do
  background do
    articles = create_list(:article, 1)
    visit root_path
    click_link 'Comment'
  end

  scenario 'successfully on an article' do
    fill_in 'Body', with: 'This is a great article'
    click_button 'Submit Comment'

    expect(page).to have_content 'Comment received'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Submit Comment'

    expect(page).to have_content "Body can't be blank"
  end

end
