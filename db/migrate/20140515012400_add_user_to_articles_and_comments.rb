class AddUserToArticlesAndComments < ActiveRecord::Migration
  def change
    add_reference :articles, :user, index: true
    add_reference :comments, :user, index: true
  end
end
