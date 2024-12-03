class PresentationsController < ApplicationController
  before_action :authenticate_user

  def index
    @presentations = Presentation.includes(:users).all

    @presentations_with_scores = @presentations.map do |presentation|
      # Calculate total average score if evaluations exist
      total_average_score = if presentation.evaluations.any?
                              (presentation.evaluations.average(:content_score).to_f +
                               presentation.evaluations.average(:organization_score).to_f +
                               presentation.evaluations.average(:time_pacing_score).to_f +
                               presentation.evaluations.average(:professionalism_score).to_f) / 4
                            else
                              nil
                            end
  
      { presentation: presentation, total_average_score: total_average_score }
    end
  end
  
  def new
    @presentation = Presentation.new
    @users = User.all
  end

  def show
    @presentation = Presentation.find(params[:id])
    @evaluations = @presentation.evaluations.includes(:user) # Fetch evaluations with associated users
  
    @average_content_score = @evaluations.average(:content_score).to_f.round(2)
    @average_organization_score = @evaluations.average(:organization_score).to_f.round(2)
    @average_time_pacing_score = @evaluations.average(:time_pacing_score).to_f.round(2)
    @average_professionalism_score = @evaluations.average(:professionalism_score).to_f.round(2)
    @total_average_score = ((
      @average_content_score + 
      @average_organization_score + 
      @average_time_pacing_score + 
      @average_professionalism_score
    ) / 4).to_f.round(2)

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
      redirect_to presentations_path, notice: "Presentation created successfully!"
    else
      flash[:alert] = "Failed to create presentation: #{@presentation.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @presentation = Presentation.find(params[:id])
    if @presentation.destroy
      redirect_to presentations_path, notice: 'Presentation deleted successfully.'
    else
      redirect_to presentations_path, alert: 'Failed to delete presentation.'
    end
  end
  
  private

  def presentation_params
    params.require(:presentation).permit(:name, user_ids: [])
  end

  def authenticate_user
    redirect_to '/' unless session[:user_id]
  end

end
