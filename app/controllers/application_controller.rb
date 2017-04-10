class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    @current_user && @current_user.admin?
  end

  # def authorize
  #   redirect_to login_path unless current_user
  # end

end
