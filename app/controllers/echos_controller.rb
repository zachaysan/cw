class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    Rails.logger.info "  Headers: #{request.headers.select {|k,v| k[0..3] == 'HTTP'}}"

    render text: :done, status: :created 
  end

end
