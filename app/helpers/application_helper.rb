module ApplicationHelper

  def sales_and_admin_display
    current_user.permission || current_user.department == "営業部"
  end

  def tech_and_admin_display
    current_user.permission || current_user.department == "技術部"
  end
end
