class AddColumnArticleId < ActiveRecord::Migration
  def change
    change_table(:comments) do |t|
      t.references :article, index:true
    end
  end
end
