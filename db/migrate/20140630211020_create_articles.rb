class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url
      t.text :title, null: false
      t.integer :created_by
      t.timestamp
    end
  end
end
