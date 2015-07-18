class AddVoteScoreToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :vote_score, :integer
  end

  def down
    remove_column :articles, :vote_score
  end
end
