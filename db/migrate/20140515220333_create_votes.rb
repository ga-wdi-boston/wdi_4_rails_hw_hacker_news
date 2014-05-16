class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id, polymorphic: true, index: true
      t.string :voteable_type, polymorphic: true, index: true
      t.integer :score

      t.timestamps
    end
  end
end
