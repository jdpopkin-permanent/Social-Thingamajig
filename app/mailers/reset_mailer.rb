class ResetMailer < ActionMailer::Base
  default from: "from@example.com"

  def password(user)
    @user = user
    @url = edit_user_url(user, key: user.set_reset_key!) # url(user, key: user's key)
    mail(to: user.email, subject: "Reset password")
  end
end
