require 'spec_helper'

feature 'User creates article' do
  background do
    visit root_path
    click_link 'New Article'
  end

  scenario 'successfully' do
    fill_in 'Title', with: 'Gotchas, Irritants, and Warts in Go Web Development'
    fill_in 'URL', with: 'https://www.braintreepayments.com/braintrust/gotchas-irritants-and-warts-in-go-web-development'
    click_button 'Create Article'
    expect(page).to have_content 'Article has been successfully created!'
    expect(page).to have_content 'Gotchas, Irritants, and Warts in Go Web Development'
  end

  scenario 'unsuccessfully due to required fields being blank' do
    click_button 'Create Article'
    expect(page).to have_content "Title can't be blank"
  end
end
