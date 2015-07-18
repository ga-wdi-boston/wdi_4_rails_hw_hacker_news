require 'rails_helper'

feature 'User views articles' do
  scenario 'sorted by vote count' do
    user = create(:user)
    article1 = create(:article)
    article2 = create(:article)
    article1.votes.create!(upvote: true, user: user)
    article2.votes.create!(upvote: false, user: user)


    visit root_path

    expect(page).to have_content (/#{article1.title}.*#{article2.title}/)

  end
end

feature 'User creates an article' do
  scenario 'successfully' do
    sign_in_as(create(:user))
    visit root_path

    click_button 'Submit a new article'

    fill_in 'URL', with: 'http://www.google.com'
    fill_in 'Title', with: 'Google!'
    click_button 'Submit Article!'

    expect(page).to have_content 'article saved!'
    expect(page).to have_content 'Google!'
  end
end
