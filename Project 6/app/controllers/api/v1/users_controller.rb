module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          # Redirect or render success response
          redirect_to '/'
        else
          # Render error messages
          flash[:alert] = @user.errors.full_messages.join(', ')
          render :new, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :role)
      end
    end
  end
end
