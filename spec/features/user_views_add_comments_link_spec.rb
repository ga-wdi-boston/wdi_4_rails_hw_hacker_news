# Passed
require 'spec_helper'

feature 'User comments on article' do
  scenario 'on front page' do
    articles = create_list(:article, 10)
    visit root_path

    articles.each do |article|
      within('tr', text: article.title) do
        expect(page).to have_content 'Add Comment'
      end
    end
  end
end
