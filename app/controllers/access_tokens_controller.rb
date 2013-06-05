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
      
      # For some reason ember data doesn't sideload (or is it overwrite?)
      # data properly on response to a post so we are going to use
      # the id as the access token on the JS side. Also, see destroy.
      render json: {:access_token => {"id"=> access_token.token }}, status: :created
    end
  end

  def destroy
    # mirros the hack on create
    token = params[:id]
    access_token = AccessToken.find_by_token(token)
    access_token.destroy
    render json: nil, status: :ok
  end

  private
  
  def access_token_params
    params.require(:access_token).permit(:email,
                                         :password)
  end
end
