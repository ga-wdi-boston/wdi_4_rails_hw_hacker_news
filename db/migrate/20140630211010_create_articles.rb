class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :url, null: false
      t.datetime :submitted_at
    end
  end
end
