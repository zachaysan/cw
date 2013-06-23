class ProducersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def create
    producer = producer_params
    producer[:owner_id] = current_user.id
    producer = Producer.create(producer)
    respond_with(producer, status: :created, location: producer)
  end

  private

  def producer_params
    params.require(:producer).permit(:name)
  end
end
