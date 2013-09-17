class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :user_id

  validates   :friend_circle_id, :user_id, presence: true
  validates   :friend_circle_id, uniqueness: { scope: :user_id }

  belongs_to(
    :friend,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to  :friend_circle,
              class_name: "FriendCircle",
              foreign_key: :friend_circle_id,
              primary_key: :id


end
