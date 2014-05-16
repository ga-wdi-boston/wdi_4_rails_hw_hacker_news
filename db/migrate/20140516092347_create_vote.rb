class CreateVote < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote
      t.references :voteable, polymorphic: true
      t.references :user

      t.timestamps
    end
  end
end
