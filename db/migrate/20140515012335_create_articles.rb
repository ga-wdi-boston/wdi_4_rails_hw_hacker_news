class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, :url
      t.timestamps
    end
  end
end
