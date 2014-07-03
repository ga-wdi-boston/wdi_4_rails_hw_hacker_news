class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.integer :score
      t.timestamps :submission_date
      t.belongs_to :user, index:true

    end
  end
end
