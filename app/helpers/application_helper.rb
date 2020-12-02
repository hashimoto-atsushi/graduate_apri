module ApplicationHelper

  def admin_and_sales_display
    current_user.permission || current_user.department == "営業部"
  end
  
end
