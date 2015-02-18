require 'rails_helper'

feature 'User views article comments' do
  background do
    @devin = create(:user, email: "devin@example.com")
    @rails = @devin.articles.create!(title: "Ruby on Rails Guides", url: "http://guides.rubyonrails.org/")
    @doc = @devin.articles.create!(title: "Rails Documentation", url: "http://api.rubyonrails.org/")
    @comment1 = @rails.comments.create!(body: "This is a negative rated comment on the ruby on rails guides article.", user_id: @devin.id)
    @comment2 = @rails.comments.create!(body: "This is a neutral comment on the ruby on rails guides article.", user_id: @devin.id)
  end

  scenario 'by clicking on comments link' do
    visit root_path

    within('.article', text: "Ruby on Rails Guides") do
      click_link "comments"
    end

    expect(page).to have_content "This is a negative rated comment on the ruby on rails guides article."
    expect(page).to have_content "This is a neutral comment on the ruby on rails guides article."
  end

  scenario 'ordered by score' do
    @comment1.votes.create!(user_id: @devin.id, is_up: false)
    visit root_path

    within('.article', text: "Ruby on Rails Guides") do
      click_link "comments"
    end

    expect(page).to have_content(/neutral.*negative/)
  end
end
