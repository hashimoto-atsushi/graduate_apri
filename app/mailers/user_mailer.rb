class UserMailer < ApplicationMailer
  def inside_info_mail(user)
    @user = user
    mail to: @user.email, subject: "承認済連絡です。"
  end

end
