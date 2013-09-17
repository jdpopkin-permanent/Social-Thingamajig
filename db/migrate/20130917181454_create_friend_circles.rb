class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.string :name
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
