class UserMailer < ApplicationMailer

  def support_program_mail_to_tech(support_program)
    @support_program = support_program
    @user = @support_program.user
    mail to: @user.email, subject: "【技術担当】【新規】保守案件登録の連絡です。"
  end

  def support_program_mail_to_sales(support_program)
    @support_program = support_program
    @user = @support_program.customer.user
    mail to: @user.email, subject: "【営業担当】【新規】登録の連絡です。"
  end

  def mail_to_system(support_program, user)
    @support_program = support_program
    @user = user
    mail to: @user.email, subject: "【システム部】【新規】登録の連絡です。"
  end

  def detail_report_mail_to_tech(detail_report)
    @detail_report = detail_report
    @user = @detail_report.support_program.user
    mail to: @user.email, subject: "【技術担当】【新規】作業報告登録の連絡です。"
  end

  def detail_report_mail_to_tech_boss(detail_report, tech_boss)
    @detail_report = detail_report
    @tech_boss = tech_boss
    mail to: @tech_boss.email, subject: "【技術部長】【新規】作業報告登録の連絡です。"
  end

end
