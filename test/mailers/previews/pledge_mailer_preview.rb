# Preview all emails at http://localhost:3000/rails/mailers/pledge_mailer
class PledgeMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    PledgeMailer.send_notification(User.first)
  end
end
