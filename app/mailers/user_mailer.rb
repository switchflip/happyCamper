class UserMailer < ActionMailer::Base
  default from: "thom.berry@gmail.com"

  def welcome_email(user)
    @user = user
    mail(:to      => user.email,
         :subject => "HappyCamper Welcome Email"
         )
  end

  def trip_invitation(user, inviter, trip)
    @user = user
    @trip = trip
    @inviter = inviter
    # @invite_url = url_for(accept_invite_url(@trip.id, @user.invite_token))
    mail(:to      => user.email,
         :subject => "You've been invited to a trip"
         )
  end  

end
