require 'rails_helper'

feature 'User logs out of account' do
  scenario 'successfully' do
    devin = create(:user, email: "devin@example.com")
    visit root_path
    sign_in_as(devin)

    click_link "Logout"

    expect(page).to have_content "Signed out successfully"

  end
end
