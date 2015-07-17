class ApplicationController < ActionController::Base
  before_action :set_user_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def set_user_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :username, :terms_version, :terms_date, :admin, :image_url, :balance, :email, :password) }
  end
end
