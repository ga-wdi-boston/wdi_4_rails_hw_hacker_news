class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :upvote
      t.references :user, index: true
      t.references :voteable, polymorphic: true, index: true
    end
  end
end
