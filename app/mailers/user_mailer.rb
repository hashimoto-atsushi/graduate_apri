class UserMailer < ApplicationMailer

  def installed_product_mail_to_sales(installed_product, current_user)
    @installed_product = installed_product
    @current_user = current_user
    mail to: @current_user.email, subject: t('mailers.sales_installed_prodects')
  end

  def part_mail_to_sales(part, current_user)
    @part = part
    @current_user = current_user
    mail to: @current_user.email, subject: t('mailers.tech_parts_products')
  end

  def product_mail_to_sales(product, current_user)
    @product = product
    @current_user = current_user
    mail to: @current_user.email, subject: t('mailers.sales_products')
  end

  def customer_mail_to_sales(customer)
    @customer = customer
    @user = @customer.user
    mail to: @user.email, subject: t('mailers.customers')
  end


  def support_program_mail_to_tech(support_program)
    @support_program = support_program
    @user = @support_program.user
    mail to: @user.email, subject: t('mailers.tech_support_programs')
  end

  def support_program_mail_to_sales(support_program)
    @support_program = support_program
    @user = @support_program.customer.user
    mail to: @user.email, subject: t('mailers.sales_support_programs')
  end

  def mail_to_system(support_program, user)
    @support_program = support_program
    @user = user
    mail to: @user.email, subject:  t('mailers.admin_support_programs')
  end

  def detail_report_mail_to_sales(detail_report)
    @detail_report = detail_report
    @user = @detail_report.support_program.customer.user
    mail to: @user.email, subject: t('mailers.sales_detail_report')
  end

  def detail_report_mail_to_tech(detail_report)
    @detail_report = detail_report
    @user = @detail_report.support_program.user
    mail to: @user.email, subject: t('mailers.tech_detail_report')
  end

  def detail_report_mail_to_tech_boss(detail_report, tech_boss)
    @detail_report = detail_report
    @tech_boss = tech_boss
    mail to: @tech_boss.email, subject: t('mailers.boss_detail_report')
  end

  def boss_check_comment_mail_to_sales(boss_check_comment)
    @boss_check_comment = boss_check_comment
    @user = @boss_check_comment.detail_report.support_program.customer.user
    mail to: @user.email, subject: t('mailers.sales_boss_check_comment')
  end

  def boss_check_comment_mail_to_tech_boss(boss_check_comment, tech_boss)
    @boss_check_comment = boss_check_comment
    @user = tech_boss
    mail to: @user.email, subject: t('mailers.boss_boss_check_comment')
  end

  def sales_check_comment_mail_to_tech(sales_check_comment)
    @sales_check_comment = sales_check_comment
    @user = @sales_check_comment.boss_check_comment.detail_report.support_program.user
    mail to: @user.email, subject: t('mailers.tech_sales_check_comment')
  end

  def sales_check_comment_mail_to_tech_boss(sales_check_comment, tech_boss)
    @sales_check_comment = sales_check_comment
    @user = tech_boss
    mail to: @user.email, subject: t('mailers.boss_sales_check_comment')
  end
  #ここからdeviseの登録メール機能
  def user_welcome_mail(user)
    @user = user
  	mail(to: @user.email, subject: 'Welcome to Our Application!')
  end


end
