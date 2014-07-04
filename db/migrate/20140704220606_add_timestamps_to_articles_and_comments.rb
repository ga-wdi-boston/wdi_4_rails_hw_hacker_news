class AddTimestampsToArticlesAndComments < ActiveRecord::Migration
  def change
    add_column :articles, :created_at, :timestamp
    add_column :comments, :created_at, :timestamp
  end
end
