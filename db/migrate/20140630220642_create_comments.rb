class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamps :submission_date
      t.belongs_to :article, index:true
      t.belongs_to :user, index:true

    end
  end
end
