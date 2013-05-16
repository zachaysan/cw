class UsersController < ApplicationController
  # TODO: Auth

  respond_to :json

  def create
    user = User.create(user_params)
    respond_with(user, :location => users_url)
  end

private

  def user_params
    params.require(:user).permit(:email,
                                 :password)
  end
end
