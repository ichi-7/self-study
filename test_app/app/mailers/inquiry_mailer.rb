class InquiryMailer < ApplicationMailer
  
  def inquiry_mail(inquiry, user)
    @inquiry = inquiry
    mail(
      to: user.email,
      subject: "イベントについて"
      )
  end
  
end
