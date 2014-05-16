require 'spec_helper'

feature 'User clicks urls' do
  scenario 'on the front page' do
    Article.create(title: "Turnspits are back", url: "http://www.turnspits.com")
    Article.create(title: "Need an article", url: "https://www.needanarticle.com")
    visit root_path
    save_and_open_page
    expect(page).to have_css 'a[href="http://www.turnspits.com"]'
    expect(page).to have_css 'a[href="https://www.needanarticle.com"]'
  end
end
