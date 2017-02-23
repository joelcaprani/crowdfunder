class PledgeMailer < ActionMailer::Base
  default from: "bitmakergroup@gmail.com"

  def send_notification(user, pledge_msg)
    @user = user
    mail(to: @user.email, subject: pledge_msg)
  end
end
