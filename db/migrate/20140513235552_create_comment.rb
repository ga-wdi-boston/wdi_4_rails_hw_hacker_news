class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comments
      t.references :article

      t.timestamps
    end
  end
end
