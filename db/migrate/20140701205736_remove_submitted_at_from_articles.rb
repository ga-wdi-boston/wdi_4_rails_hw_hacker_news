class RemoveSubmittedAtFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :submitted_at
  end
end
