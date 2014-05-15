class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.string :title, :body
      t.timestamp :submission_date
    end
  end
end
