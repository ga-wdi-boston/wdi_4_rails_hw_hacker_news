require 'rails_helper'

feature "User creates a artcile" do
  background do
    visit root_path
    click_link 'Create new article'
  end

  scenario 'successfully' do
  end

end
