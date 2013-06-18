class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def authenticate!
    raise :fuck unless request.headers.include?('HTTP_AUTHORIZATION')
    auth_token = request.headers['HTTP_AUTHORIZATION']
    raise :uncomplete
  end
end
