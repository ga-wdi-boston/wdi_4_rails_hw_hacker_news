class AddUserArticleRelationship < ActiveRecord::Migration
  def change
    remove_column :articles, :created_by, :integer
    add_column :articles, :user_id, :integer, references: :users
  end
end
