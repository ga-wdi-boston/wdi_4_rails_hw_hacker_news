require 'spec_helper'

feature 'User views articles' do
  scenario 'on the front page' do
    articles = create_list(:article, 1)

    visit root_path

    articles.each do |article|
      expect(page).to have_content article.title
    end
  end

end
