class CreateManagedComments < ActiveRecord::Migration
  def change
    create_table :managed_comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true

      t.timestamps
    end
  end
end
