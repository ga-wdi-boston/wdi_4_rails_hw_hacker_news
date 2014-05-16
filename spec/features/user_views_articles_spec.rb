# Passed
require 'spec_helper'

feature 'User views articles' do
  scenario 'on the front page' do
    articles = create_list(:article, 10)
    visit root_path

    articles.each do |article|
      expect(page).to have_content article.title
      expect(page).to have_css 'a[href=', article.url
    end
  end
end
