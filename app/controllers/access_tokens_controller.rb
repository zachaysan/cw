class AccessTokensController < ApplicationController

  respond_to :json

  def create
    user = User.authenticate(access_token_params)
    if not user
      respond_with(:error => "Password is wrong or email (user) doesn't exist",
                   :status => :unauthorized)
    else
      access_token = AccessToken.find_by_user_id(user.id) || AccessToken.create(:user => user)
      access_token.update_attribute(:updated_at, Time.now)
      
      render json: {:access_token => access_token}, status: :created
    end
  end

  private
  
  def access_token_params
    params.require(:access_token).permit(:email,
                                         :password)
  end
end
