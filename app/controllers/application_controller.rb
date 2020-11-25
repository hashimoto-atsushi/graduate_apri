class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number, :name, :department, :position, :permission, :cellphone_number, :stay_or_left])
    devise_parameter_sanitizer.permit(:account_update, keys: [:employee_number, :name, :department, :position, :permission, :cellphone_number, :stay_or_left])
  end
end
