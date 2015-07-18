class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comments
      t.references :article, index: true
      t.references :user, index: true
    end
  end
end
