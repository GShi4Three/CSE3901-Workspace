class StudentsController < ApplicationController
  before_action :require_login
  before_action -> { require_role('student') }

  def dashboard
    # student-specific logic
  end
end
