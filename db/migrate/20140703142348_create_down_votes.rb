class CreateDownVotes < ActiveRecord::Migration
  def change
    create_table :down_votes do |t|
      t.references :user, index:true
      t.references :down_voteable, polymorphic:true, index:true

      t.timestamps
    end
  end
end
