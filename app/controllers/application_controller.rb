class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :username
  #   devise_parameter_sanitizer.for(:account_update) << :username
  # end
end
