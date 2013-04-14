class UserMailer < ActionMailer::Base
  default from: "thom.berry@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to      => user.email,
         :subject => "HappyCamper Welcome Email"
         )
  end
end
