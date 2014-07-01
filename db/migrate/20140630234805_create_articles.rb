class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.datetime :submitted_at
    end
  end
end
