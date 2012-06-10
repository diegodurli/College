class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    respond_to do |format|
      if user && user.authenticate(params[:password])
        cookies.permanent[:auth_token] = user.auth_token
        format.html { redirect_to root_path, notice: 'User was logged in successfully.' }
      else
        flash.now.alert = 'Your email or password is invalid.'
        format.html { render :new }
      end
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: 'User was logged out successfully.'
  end
end
