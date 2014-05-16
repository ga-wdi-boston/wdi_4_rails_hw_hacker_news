class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :rating
      t.belongs_to :voteable, polymorphic: true, index:true
      t.timestamps
    end
  end
end
