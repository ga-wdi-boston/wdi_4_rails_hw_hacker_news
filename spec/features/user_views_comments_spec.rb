require 'spec_helper'

feature 'User views comments' do
  scenario 'on the comments page' do
    articles = create_list(:article, 2)
    comments = create_list(:comment, 4)

    visit root_path

    # Expect a page to have article.comments.

    articles.each do |article|
      within('tr', text: article.title) do
        click_button 'comments'
      end
    end
  end
end
