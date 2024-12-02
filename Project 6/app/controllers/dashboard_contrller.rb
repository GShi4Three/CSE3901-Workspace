class DashboardController < ApplicationController
  before_action :require_login

  def index
    case current_user.role
    when 'ta'
      redirect_to ta_presentations_path
    when 'student'
      redirect_to student_presentations_path
    else
      redirect_to root_path, alert: 'Invalid role'
    end
  end
end
