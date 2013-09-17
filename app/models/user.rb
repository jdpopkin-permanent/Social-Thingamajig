class User < ActiveRecord::Base
  attr_accessible :email, :session_token, :password
  attr_reader :password

  validates :email, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  before_validation { |user| user.reset_session_token!(false) }

  has_many(
    :owned_friend_circles,
    class_name: "FriendCircle",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many  :friend_circle_memberships,
            class_name: 'FriendCircleMembership',
            foreign_key: :user_id,
            primary_key: :id,
            dependent: :destroy

  has_many  :member_friend_circles,
            through: :friend_circle_memberships,
            source: :friend_circle


  def reset_session_token!(force = true)
    return unless self.session_token.nil? || force
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def set_reset_key!
    key = SecureRandom::urlsafe_base64(16)
    self.reset_key = key
    self.save!
    key
  end

end
