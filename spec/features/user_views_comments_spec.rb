require 'spec_helper'

feature 'User views comments' do
  scenario 'on the article show page' do

    comments = create_list(:comment, 3)

    visit comments_path

    comments.each do |comment|
      within('tr', text: comment.title) do
        expect(page).to have_content comment.body
        expect(page).to have_content comment.submission_date
      end
    end


  end

end
