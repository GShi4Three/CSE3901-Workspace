class RosterController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_ta, only: [:index, :update_role, :destroy]

  # Roster page for TAs
  def index
    @users = User.all
  end

  # Update user role
  def update_role
    @user = User.find(params[:id]) # Find the user by ID
    if @user.update(role: params[:role]) # Update the role with the provided value
      redirect_to roster_path, notice: "User role updated successfully."
    else
      redirect_to roster_path, alert: @user.errors.full_messages.join(", ")
    end
  end
  
  # Delete a user
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to roster_path, notice: "User deleted successfully."
    else
      redirect_to roster_path, alert: @user.errors.full_messages.join(", ")
    end
  end

  private

  def authenticate_user
    redirect_to '/' unless session[:user_id]
  end

  def authorize_ta
    if current_user&.role != 'ta' && request.path == roster_path
      redirect_to presentations_path, alert: 'Access denied! Only TAs can access this page.'
    end
  end
end