class Post < ActiveRecord::Base
  attr_accessible :body, :user_id, :friend_circle_ids

  has_many  :links,
            class_name: "Link",
            foreign_key: :post_id,
            primary_key: :id

  has_many :post_shares,
            class_name: "PostShare",
            primary_key: :id,
            foreign_key: :post_id

  has_many :friend_circles,
            through: :post_shares,
            source: :friend_circle

  def friend_circle_ids=(ids)
    self.friend_circles = ids.map do |id|
      FriendCircle.find(id)
    end
  end

end
