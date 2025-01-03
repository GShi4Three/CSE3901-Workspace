class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      # Successful login
      session[:user_id] = user.id
      redirect_to '/presentations'
    else
      # Failed login
      flash[:alert] = 'Invalid email or password. Please try again.'
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil # Clear the user session
    redirect_to login_path, notice: 'Logged out successfully.'
  end
end
