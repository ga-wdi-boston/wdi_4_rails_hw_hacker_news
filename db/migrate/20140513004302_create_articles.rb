class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :url
      t.text :title, presence: true
      t.timestamps
    end
  end
end
