class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
    return '/users/sign_in'
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :Photo, :Bio, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:Name, :Photo, :Bio, :email, :password, :current_password)}
  end

end
