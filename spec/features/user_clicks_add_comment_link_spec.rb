require 'spec_helper'

feature 'User clicks on add comment' do
  scenario 'successfully for first article' do
    articles = create_list(:article, 10)
    visit root_path
    articles.first do |article|
      within('tr', text: article.title) do
        click_link 'Add Comment'
        fill_in 'Comment', with: 'Dude what is this garbage you are writing?'
        click_button 'Add Comment'
      end
    end
  end

  # scenario 'unsuccessfully due to required fields being blank' do
  #   click_button 'Create Player'

  #   expect(page).to have_content "Comment can't be blank"
  # end
end
