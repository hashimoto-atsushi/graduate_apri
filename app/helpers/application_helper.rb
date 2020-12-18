module ApplicationHelper

  def sales_and_admin_display
    current_user.permission || current_user.department == t('application.sales')
  end

  def tech_and_admin_display
    current_user.permission || current_user.department == t('application.tech')
  end

  def tech_in_charge_and_admin_display
    current_user == @support_program.user || current_user.permission
  end

  def boss_and_admin_display
    boss_status = current_user.position == t('application.boss') && current_user.department == t('application.tech')
    boss_status || current_user.permission
  end

  def sales_in_charge_and_admin_display
    current_user == @boss_check_comment.detail_report.support_program.customer.user || current_user.permission
  end

  def full_title(page_title="")
    base_title = ""
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

end
