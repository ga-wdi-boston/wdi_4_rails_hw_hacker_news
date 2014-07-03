class AddUpVotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.references :upvoteable, polymorphic: true, index: true
    end
  end
end
