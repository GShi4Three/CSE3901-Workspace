class PresentationsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_ta

  def index
    @presentations = Presentation.includes(:users).all
  end

  def index_ta
    @presentations = Presentation.includes(:users).all
  end 
  
  def new
    @presentation = Presentation.new
    @users = User.all
  end

  def create

    Rails.logger.debug "Parameters received: #{params.inspect}"

    @presentation = Presentation.new(presentation_params)
    if @presentation.save
      redirect_to presentations_ta_path, notice: "Presentation created successfully!"
    else
      flash[:alert] = "Failed to create presentation: #{@presentation.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @presentation = Presentation.find(params[:id])
    if @presentation.destroy
      redirect_to presentations_ta_path, notice: 'Presentation deleted successfully.'
    else
      redirect_to presentations_ta_path, alert: 'Failed to delete presentation.'
    end
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, user_ids: [])
  end

  def authenticate_user
    redirect_to '/', alert: 'Please log in first!' unless session[:user_id]
  end

  def authorize_ta
    redirect_to '/presentations', alert: 'Access denied!' unless session[:user_id]
  end

end
