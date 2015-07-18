class RemoveUpvotesFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :upvotes
  end
end
