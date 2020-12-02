class UserMailer < ApplicationMailer

  def installed_product_mail_to_sales(installed_product, current_user)
    @installed_product = installed_product
    @current_user = current_user
    mail to: @current_user.email, subject: "【担当】【新規】納入機器の情報登録の連絡です。"
  end

  def part_mail_to_sales(part, current_user)
    @part = part
    @current_user = current_user
    mail to: @current_user.email, subject: "【担当】【新規】保守パーツ情報登録の連絡です。"
  end

  def product_mail_to_sales(product, current_user)
    @product = product
    @current_user = current_user
    mail to: @current_user.email, subject: "【担当】【新規】製品情報登録の連絡です。"
  end

  def customer_mail_to_sales(customer)
    @customer = customer
    @user = @customer.user
    mail to: @user.email, subject: "【営業担当】【新規】顧客情報登録の連絡です。"
  end


  def support_program_mail_to_tech(support_program)
    @support_program = support_program
    @user = @support_program.user
    mail to: @user.email, subject: "【技術担当】【新規】保守案件登録の連絡です。"
  end

  def support_program_mail_to_sales(support_program)
    @support_program = support_program
    @user = @support_program.customer.user
    mail to: @user.email, subject: "【営業担当】【新規】保守案件登録の連絡です。"
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

  def boss_check_comment_mail_to_sales(boss_check_comment)
    @boss_check_comment = boss_check_comment
    @user = @boss_check_comment.detail_report.support_program.customer.user
    mail to: @user.email, subject: "【営業担当】【新規】の上長確認報告の連絡です。"
  end

  def boss_check_comment_mail_to_tech_boss(boss_check_comment, tech_boss)
    @boss_check_comment = boss_check_comment
    @user = tech_boss
    mail to: @user.email, subject: "【技術部長】【新規】の上長確認報告の連絡です。"
  end

  def sales_check_comment_mail_to_tech(sales_check_comment)
    @sales_check_comment = sales_check_comment
    @user = @sales_check_comment.boss_check_comment.detail_report.support_program.user
    mail to: @user.email, subject: "【技術担当】【新規】営業確認終了の連絡です。"
  end

  def sales_check_comment_mail_to_tech_boss(sales_check_comment, tech_boss)
    @sales_check_comment = sales_check_comment
    @user = tech_boss
    mail to: @user.email, subject: "【技術部長】【新規】営業確認終了の連絡です。"
  end

end
