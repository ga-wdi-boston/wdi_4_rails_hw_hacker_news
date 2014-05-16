require 'spec_helper'

feature 'User votes' do
  background do
    articles = create_list(:article, 1)
    visit root_path
    # click_link 'Vote up'
  end

  scenario 'successfully on an article' do

  end

  scenario 'unsuccessfully' do

  end

end
