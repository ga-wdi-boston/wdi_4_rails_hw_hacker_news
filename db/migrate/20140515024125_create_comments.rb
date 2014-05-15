class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article, index: true
      t.string :title, :body
      t.timestamp :submission_date
    end
  end
end
