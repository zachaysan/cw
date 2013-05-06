class UsersController < ApplicationController
  # TODO: Auth

  def create
    user = User.new
    if update_user(user)
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if update_user(user)
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: nil, status: :ok
  end

private

  def permitted_params
    params.require(:user).permit(:email,
                                 :password])
  end

  def update_user(user)
    user_params = permitted_params
    User.transaction do
      user.attributes = user_params
      user.save!
    end
    user.reload

    return true
  rescue
    return false
  end
end
