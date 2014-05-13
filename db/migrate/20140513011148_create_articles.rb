class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :url
      t.timestamps
    end
  end
end
