class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    result = UserRegistration.call(**user_params)

    if result.success?
      render json: result.user, status: :created
    else
      render json: result.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone)
  end
end
