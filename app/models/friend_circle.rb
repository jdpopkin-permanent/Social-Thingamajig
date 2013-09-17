class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friend_ids

  belongs_to(
    :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many  :friend_circle_memberships,
            class_name: "FriendCircleMembership",
            foreign_key: :friend_circle_id,
            primary_key: :id,
            dependent: :destroy

  has_many  :friends,
            through: :friend_circle_memberships,
            source: :friend

  def friend_ids=(user_id_arr)
    users = user_id_arr.map do |id|
      User.find(id)
    end
    self.friends = users
  end

  # has many members

  # has many
end
