class AddArticles < ActiveRecord::Migration
  def change
    create_table(:articles) do |t|
      t.string :title
      t.string :url
      t.datetime :submitted_on

      t.timestamps
    end

  end
end
