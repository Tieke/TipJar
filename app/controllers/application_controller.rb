class ApplicationController < ActionController::Base
  before_action :set_user_params, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  protected
  def set_user_params
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :username, :coinbase_user_id, :coinbase_access_token, :terms_version, :terms_date, :admin, :image_url, :about, :balance, :email, :password) }
  end
end
