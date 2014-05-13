require 'spec_helper'

feature 'User can view recent articles' do
  scenario 'on the front page' do
    articles = create_list(:article, 4)

    visit articles_path

    articles.each do |article|
      within( 'ul') do
        expect(page).to have_content article.title
      end
    end
  end
end
