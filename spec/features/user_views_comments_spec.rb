require 'spec_helper'

feature 'User views comments' do
  scenario 'on the comments page' do
    comments = create_list(:comment, 10)


    visit comments_path

    comments.each do |comment|
      within('tr', text: comment.message) do
        expect(page).to have_content comment.message
      end
    end
  end
end
