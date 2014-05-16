class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, :url
      t.timestamp :created_at
    end
  end
end
