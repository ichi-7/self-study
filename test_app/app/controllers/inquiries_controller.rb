class InquiriesController < ApplicationController
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.inquiry_mail(@inquiry,current_user).deliver
      redirect_to groups_path, notice: 'お問い合わせ内容を送信しました'
    else
      render :new
    end
  end
  
  private
  
  def inquiry_params
    params.require(:inquiry).permit(:name, :message)
  end  
  
end
