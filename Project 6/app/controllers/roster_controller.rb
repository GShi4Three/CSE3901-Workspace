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
    user = User.find(session[:user_id])
    redirect_to '/presentations', alert: 'Access denied!' unless user.role == 'ta'
  end
end