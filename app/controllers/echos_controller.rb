class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    puts params
    render text: :done, status: :created 
  end

  private

end
