require 'spec_helper'

feature 'User views articles' do
  scenario 'on the front page' do
    articles = create_list(:article, 3)

    visit root_path

    articles.each do |article|
      within('tr', text: article.title) do
        expect(page).to have_content article.url
        expect(page).to have_content article.created_at
      end
    end
  end
end
