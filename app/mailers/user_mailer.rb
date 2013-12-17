class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    @user = user
    @url = edit_user_url(user)
    mail(to: user.email, subject: 'Reset Password')
  end
end
