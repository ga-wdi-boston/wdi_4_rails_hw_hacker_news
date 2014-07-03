class AddIndexes < ActiveRecord::Migration
  def up
    add_index :articles, :user_id
    add_index :comments, :user_id
    add_index :comments, :article_id
  end
  def down
    remove_index :articles, :user_id
    remove_index :comments, :user_id
    remove_index :comments, :article_id
  end
end
