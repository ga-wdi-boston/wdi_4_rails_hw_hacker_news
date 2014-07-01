class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.timestamps :submission_date
      t.belongs_to :users, index:true

    end
  end
end
