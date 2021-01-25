class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'header'
  
  
  

  helper_method :redirect_if_not_logged_in, :log_in, :current_user, :current_user?, :logged_in?, :log_out

  private

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if(user_id = session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end



end
