module ApplicationHelper

  def sales_and_admin_display
    current_user.permission || current_user.department == "営業部"
  end

  def tech_and_admin_display
    current_user.permission || current_user.department == "技術部"
  end

  def tech_in_charge_and_admin_display
    current_user == @support_program.user || current_user.permission
  end

  def boss_and_admin_display
    boss_status = current_user.position == "部長" && current_user.department == "技術部"
    boss_status || current_user.permission
  end
end
