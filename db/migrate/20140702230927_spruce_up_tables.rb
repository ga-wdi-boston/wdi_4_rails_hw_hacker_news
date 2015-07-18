class SpruceUpTables < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.remove :user_name
      t.remove :points
      t.datetime :submission_date
    end

    change_table :comments do |t|
      t.remove :user_name
      t.remove :text_box
      t.remove :article_id
      t.text :content
      t.datetime :submission_date
    end

    create_table :points do |t|
      t.integer :number_of_points
      t.boolean :is_upvote
    end
  end
end
