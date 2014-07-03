class AddVoteScoreToComments < ActiveRecord::Migration
  def up
    add_column :comments, :vote_score, :integer
  end

  def down
    remove_column :comments, :vote_score
  end
end
