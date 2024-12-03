class TasController < ApplicationController
  before_action :require_login
  before_action -> { require_role('ta') }

  def dashboard
    
  end
end
