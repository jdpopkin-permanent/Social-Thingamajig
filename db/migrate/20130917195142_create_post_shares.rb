class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :post_id, index: true
      t.integer :friend_circle_id, index: true


      t.timestamps
    end
  end
end
