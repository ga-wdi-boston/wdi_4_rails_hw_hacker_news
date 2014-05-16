class AddIndexToArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.index :title
    end
  end
end
