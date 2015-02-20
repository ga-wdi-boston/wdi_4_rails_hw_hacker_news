class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :article, index: true
      t.text :content

      t.timestamp
    end
  end
end
