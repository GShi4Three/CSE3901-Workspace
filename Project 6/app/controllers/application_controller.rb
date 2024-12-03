class ApplicationController < ActionController::Base
  
  allow_browser versions: :modern

helper_method :current_user, :logged_in?


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  
  def logged_in?
    current_user.present?
  end

  
  def require_login
    redirect_to login_path, alert: 'User login required.' unless logged_in?
  end

  
  def require_role(role)
    unless logged_in? && current_user.role == role
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end