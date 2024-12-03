class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      # Successful login
      session[:user_id] = user.id
      if user.role == 'student'
        redirect_to '/presentations', notice: 'Welcome back, student!'
      elsif user.role == 'ta'
        redirect_to '/presentations/ta', notice: 'Welcome back, TA!'
      end
    else
      # Failed login
      flash[:alert] = 'Invalid email or password. Please try again.'
      redirect_to '/'
    end
  end
end
