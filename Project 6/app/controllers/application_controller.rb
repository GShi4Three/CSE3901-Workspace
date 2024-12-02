class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

helper_method :current_user, :logged_in?

  # Return the currently logged-in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Check if a user is logged in
  def logged_in?
    current_user.present?
  end

  # Redirect to login page if the user is not logged in
  def require_login
    redirect_to login_path, alert: 'User login required.' unless logged_in?
  end

  # Restrict access based on the user's role
  def require_role(role)
    unless logged_in? && current_user.role == role
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end