class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request

  # POST /signup
  # return authenticated token upon signup
  def create
    @user = User.new(user_params)
    if @user.save
      auth_token = AuthenticateUser.new(@user.email, @user.password).call
      render json: { user: {
        name: @user.name,
        email: @user.email
      }, auth_token: auth_token }
    else
      render json: { error: @user.errors }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password
    )
  end
end
