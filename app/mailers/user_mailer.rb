class UserMailer < ActionMailer::Base
  default from: "thom.berry@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to      => user.email,
         :subject => "HappyCamper Welcome Email"
         )
  end

  def trip_invitation(invited_user, inviting_user, trip)
    @invited_user  = invited_user
    @inviting_user = inviting_user
    @trip          = trip
    @invite_url    = url_for(:controller   => 'users',
                             :action       => 'invite', 
                             :invite_token => @invited_user.invite_token,
                             :only_path    => false)
    mail(:to      => @invited_user.email,
         :subject => "You've been invited to a trip")
  end

end
