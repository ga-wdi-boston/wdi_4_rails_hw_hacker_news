class AddTblesToDatabase < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :user_name, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.integer :points, default: 0

      t.timestamps
    end

    create_table :comments do |t|
      t.text :text_box, null: false
      t.string :user_name, null: false
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
