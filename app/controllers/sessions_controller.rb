class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_path, notice: 'User was logged in successfully.'
    else
      flash.now.notice = 'Your email or password is invalid.'
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: 'User was logged out successfully.'
  end
end
