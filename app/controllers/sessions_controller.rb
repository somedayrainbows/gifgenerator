class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    # nil error was related to nested params, needed to add session path to email -- remember to always check params
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in."
      redirect_to user_path(@user)
    else
      flash[:error] = "There was an error logging in. Please check your email and password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to login_path
  end

end
