class ApplicationController < ActionController::Base
  protect_from_forgery

  def allowed_user(email)
    return email == current_user.email
  end

  def authenticate!
    unless request.headers.include?('HTTP_AUTHORIZATION')
      return unauthorized
    end
    token = request.headers['HTTP_AUTHORIZATION']
    access_token = AccessToken.find_by_token(token)
    unauthorized unless access_token
    @current_user = User.find_by_id(access_token.user_id)
  end

  def current_user
    return @current_user || authenticate!
  end

  def unauthorized
    text = "HTTP_AUTHORIZATION header missing or access_token revoked or requesting incorrect user"
    render text: text, status: :unauthorized and return
  end

  def owns(resource)
    if resource.is_a? Producer
      producer = resource
      producer.users.include?(current_user)
    elsif resource.is_a? Consumer
      producer = resource.producer
      producer.users.include?(current_user)
    elsif resource.is_a? Webhook
      producer = resource.producer
      producer.users.include?(current_user)
    else
      false
    end
  end
end
