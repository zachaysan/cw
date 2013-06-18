class ProducersController < ApplicationController

  respond_to :json

  def create
    authenticate!
    producer = Producer.create(producer_params)
    respond_with(producer, :location => producer)
  end

  private

  def producer_params
    params.require(:producer).permit(:name,
                                     :owner_id,
                                     :user_ids)
  end
end
