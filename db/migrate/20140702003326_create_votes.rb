class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :voteable, polymorphic: true, index: true
      t.string :vote, null: false

      t.timestamps
    end

    add_index :votes, :vote
  end
end
