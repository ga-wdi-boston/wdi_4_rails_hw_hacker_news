class AddUserIdToCommentsAndArticles < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.integer :user_id
    end
  end
end
class AddUserIdToCommentsAndArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.integer :user_id
    end
  end
end
