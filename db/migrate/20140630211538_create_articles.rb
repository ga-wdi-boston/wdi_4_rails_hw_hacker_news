class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
