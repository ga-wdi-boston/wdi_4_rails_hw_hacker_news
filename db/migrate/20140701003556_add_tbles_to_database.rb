class AddTblesToDatabase < ActiveRecord::Migration
  def change
    change_column_null(:articles, :url, false)
    change_column_default(:articles, :url, 0)
    create_table :articles do |t|
      t.string :user_name, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.integer :points, default: 0
      #t.datetime :submitted_at
      #t.belongs_to :user, index: true (references)
      #t.integer :user_id - you cant use index: true here
      t.timestamps
    end

    create_table :comments do |t|
      t.text :text_box, null: false
      t.string :user_name, null: false
      #t.datetime :submitted_at
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
