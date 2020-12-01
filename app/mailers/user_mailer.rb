class UserMailer < ApplicationMailer

  def mail_to_tech(support_program)
    @support_program = support_program
    @user = @support_program.user
    mail to: @user.email, subject: "【技術担当】登録の連絡です。"
  end

  def mail_to_sales(support_program)
    @support_program = support_program
    @user = @support_program.customer.user
    mail to: @user.email, subject: "【営業担当】登録の連絡です。"
  end

  def mail_to_system(support_program, user)
    @support_program = support_program
    @user = user
    mail to: @user.email, subject: "【システム部】登録の連絡です。"
  end

end
