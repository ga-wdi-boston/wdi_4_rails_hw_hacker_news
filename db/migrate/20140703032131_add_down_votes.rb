class AddDownVotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.references :downvoteable, polymorphic: true, index: true
    end
  end
end
