class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(email: params[:session][:email])
    # nil error was related to nested params, needed to add session path to email -- remember to always check params
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in."
      redirect_to user
    else
      flash[:error] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to login_path
  end

end
