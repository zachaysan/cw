class UsersController < ApplicationController

  respond_to :json

  def create
    user = User.create(user_params)
    respond_with(user, :location => user)
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password)
  end
end
