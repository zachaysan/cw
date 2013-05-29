class AccessTokensController < ApplicationController

  respond_to :json

  def create
    user = User.authenticate(access_token_params)
    if not user
      respond_with(:error => "Password is wrong or email (user) doesn't exist",
                   :status => :unauthorized)
    else
      access_token = AccessToken.find_or_create_by_user(user)
      puts access_token
      access_token.update_attribute(:updated_at, Time.now)
      respond_with(access_token,
                   :location => access_tokens_url)
    end
  end

  private
  
  def access_token_params
    params.require(:access_token).permit(:email,
                                         :password)
  end
end
