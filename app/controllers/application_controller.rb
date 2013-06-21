class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def authenticate!
    unauthorized unless request.headers.include?('HTTP_AUTHORIZATION')
    token = request.headers['HTTP_AUTHORIZATION']
    access_token = AccessToken.find_by_token(token)
    unauthorized unless access_token
    @current_user = User.find_by_id(access_token.user_id)
  end

  def current_user
    return @current_user || authenticate!
  end

  def unauthorized
    text = "HTTP_AUTHORIZATION header missing or access_token revoked"
    render text: text, status: :unauthorized
  end
end
