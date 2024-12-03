class EvaluationsController < ApplicationController
  before_action :authenticate_user

  def create
    @presentation = Presentation.find(params[:presentation_id])

    # Check if the user has already submitted an evaluation
    existing_evaluation = @presentation.evaluations.find_by(user_id: current_user.id)
    if existing_evaluation
      redirect_to evaluation_path(existing_evaluation), alert: "You have already submitted an evaluation for this presentation."
      return
    end

    # If no evaluation exists, create a new one
    @evaluation = @presentation.evaluations.new(evaluation_params)
    @evaluation.user = current_user

    if @evaluation.save
      redirect_to evaluation_path(@evaluation), notice: "Evaluation submitted successfully."
    else
      flash[:alert] = @evaluation.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @evaluation = Evaluation.includes(:user, :presentation).find(params[:id])
  end
  
  private

  def evaluation_params
    params.require(:evaluation).permit(:content_score, :organization_score, :time_pacing_score, :professionalism_score, :comments)
  end

  def authenticate_user
    redirect_to '/' unless session[:user_id]
  end

end
