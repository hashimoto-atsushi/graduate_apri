class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :name, :department, :position, :permission, :cellphone_number, :stay_or_left])
    devise_parameter_sanitizer.permit(:account_update, keys: [:employee_number, :name, :department, :position, :permission, :cellphone_number, :stay_or_left])
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    top_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def systems_members
    @user = User.where(department: 2)
  end

  def tech_boss
    @user = User.where(position: 0).find_by(department: 1)
  end

  def admin_and_sales_login
    current_user.permission || current_user.department == "営業部"
  end


end
