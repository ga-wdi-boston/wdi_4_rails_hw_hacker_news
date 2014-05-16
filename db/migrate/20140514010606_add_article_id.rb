class AddArticleId < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :article_id
    end
  end
end
