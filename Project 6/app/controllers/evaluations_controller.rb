class EvaluationsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_ta
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def authenticate_user
    redirect_to '/' unless session[:user_id]
  end

  def authorize_ta
    if current_user&.role != 'ta' && request.path != evaluations_path
      redirect_to evaluations_path, alert: 'Access denied! Only TAs can access this page.'
    end
  end
end
