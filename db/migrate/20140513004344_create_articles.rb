class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url, null: false
      t.text :title, null: false
      t.timestamps
    end
  end
end
