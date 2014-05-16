require 'spec_helper'
feature 'User creates article' do
  scenario 'successfully' do

    visit root_path
    click_link 'New Article'
    fill_in 'Title', with: 'Title1'
    fill_in 'Url', with: 'http://url1.com'
    click_button 'Create Article'

    expect(page).to have_content 'Article successfully created'
    expect(page).to have_content 'Title1'
    expect(page).to have_css 'a', 'http://url1.com'
  end

  scenario 'unsuccessfully due to required fields being blank' do

    visit root_path
    click_link 'New Article'
    click_button 'Create Article'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Url can't be blank"
  end
    scenario 'unsuccessfully due wrong format of url' do

    visit root_path
    click_link 'New Article'
    fill_in 'Title', with: 'Title1'
    fill_in 'Url', with: 'www.url1.com'
    click_button 'Create Article'

    expect(page).to have_content "Url is invalid"
  end
end


