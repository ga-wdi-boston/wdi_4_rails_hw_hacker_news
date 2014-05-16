require 'spec_helper'

feature 'User comments on article' do
  background do
    articles = create_list(:article, 10)
    visit root_path
  end
  scenario 'successfully for each article' do
    articles.each do |article|
      within('tr', text: article.title) do
        expect(page).to have_content 'Add Comment'
        click_link 'Add Comment'
        fill_in 'Comment', with: 'Dude what is this garbage you are writing?'
        click_button 'Add Comment'
        expect(page).to have_content 'Comment Added'
        expect(page).to have_content 'Dude what is this garbage you are writing?'
      end
    end
  end

  # scenario 'unsuccessfully due to required fields being blank' do
  #   click_button 'Create Player'

  #   expect(page).to have_content "Comment can't be blank"
  # end
end
