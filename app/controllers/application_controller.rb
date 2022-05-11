class ApplicationController < ActionController::Base

  before_action :login_required!

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def login_required!
    return if logged_in?

    redirect_to new_session_path, notice: t('login_required')
  end
  
end
