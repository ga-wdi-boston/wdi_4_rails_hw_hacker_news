class AddUsertoVote < ActiveRecord::Migration
  def change
    change_table :votes do |t|
      t.references :users, index: true
    end
  end
end
