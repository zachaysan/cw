class AccessTokensController < ApplicationController

  respond_to :json

  def create
    user = User.authenticate(user_auth_params)
    if not user
      respond_with(:error => "Password is wrong or email (user) doesn't exist", :status => :unauthorized)
    else
      access_token = AccessToken.find_or_create_by_user(user)
      access_token.update_attribute(:updated_at, Time.now)
      respond_with(access_token,
                   :location => access_tokens_url)
    end
  end

  private
  
  def user_auth_params
    params.require(:user_auth).requre(:email,
                                      :password)
  end
end
