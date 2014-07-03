class AddVoteValueToVotes < ActiveRecord::Migration
  def up
    add_column :votes, :value, :string
  end

  def down
    remove_column :votes, :value
  end
end
