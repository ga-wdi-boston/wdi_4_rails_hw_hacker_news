class AddScoreToCommentsAndArticles < ActiveRecord::Migration
  def change
    add_column :comments, :score, :integer, default: 0
    add_column :articles, :score, :integer, default: 0
  end
end
