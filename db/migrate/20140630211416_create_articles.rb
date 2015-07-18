class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :user_id
      t.timestamp :submitted_at

      t.timestamps
    end

    add_index :articles, :user_id
    add_index :articles, :submitted_at
  end
end
