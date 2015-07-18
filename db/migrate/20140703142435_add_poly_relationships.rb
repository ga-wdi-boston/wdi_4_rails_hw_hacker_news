class AddPolyRelationships < ActiveRecord::Migration
  def change
    change_column_default(:points, :number_of_points, 0)
    change_table :points do |t|
      t.remove :is_upvote
      t.references :user, index: true
      t.references :pointable, polymorphic: true, index: true
    end
  end
end
