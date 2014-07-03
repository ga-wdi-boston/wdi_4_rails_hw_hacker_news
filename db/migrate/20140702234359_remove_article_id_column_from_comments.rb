class RemoveArticleIdColumnFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :article_id
  end
end
