class ProducersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json

  def create
    authenticate!
    producer = producer_params
    producer[:owner_id] = current_user.id
    producer = Producer.create(producer)
    # TODO make JSON response default for all 
    # resources.
    respond_with(producer, status: :created, location: producer)
  end

  private

  def producer_params
    params.require(:producer).permit(:name)
  end
end
