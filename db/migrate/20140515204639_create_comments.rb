class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.text :author
      t.timestamps
    end
  end
end
