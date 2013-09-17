class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :user_id, index: true
      t.integer :friend_circle_id, index: true

      t.timestamps
    end
  end
end
