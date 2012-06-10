class ApplicationController < ActionController::Base
  protect_from_forgery
  include UsersHelper
  
  private

  def authorize
    redirect_to login_path, alert: 'You need to Signup or Login to view this page.' if current_user.nil?
  end
end
