class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def authorize
    redirect_to login_path, alert: 'You need to Signup or Login to view this page.' if current_user.nil?
  end
end
