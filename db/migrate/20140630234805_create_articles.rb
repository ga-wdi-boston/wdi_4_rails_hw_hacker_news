class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :url, null: false
      t.timestamps
    end
  end
end
