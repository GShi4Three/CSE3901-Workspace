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

  def show
    @presentation = Presentation.find(params[:id])
  
    # Check if the user has already submitted an evaluation
    existing_evaluation = @presentation.evaluations.find_by(user_id: current_user.id)
    if existing_evaluation
      redirect_to evaluation_path(existing_evaluation), alert: "You have already submitted an evaluation for this presentation."
      return
    end
  
    @evaluation = Evaluation.new
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
    redirect_to '/' unless session[:user_id]
  end

  def authorize_ta
    if current_user&.role != 'ta' && request.path == presentations_ta_path
      redirect_to presentations_path, alert: 'Access denied! Only TAs can access this page.'
    end
  end

end
