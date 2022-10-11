class InquiryMailer < ApplicationMailer
  
  def inquiry_mail(inquiry, user)
    @inquiry = inquiry
    mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて"
  end
  
end
