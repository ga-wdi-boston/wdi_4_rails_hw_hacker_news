class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :body
      t.references :user, index: true
      t.references :comment

      t.timestamps
    end
  end
end
