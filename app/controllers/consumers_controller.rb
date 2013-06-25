class ConsumersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    producer_id = params[:producer_id]
    producer = Producer.find(producer_id)
    return unauthorized unless owns(producer)
    consumers = producer.consumers
    respond_with(consumers, status: :ok, location: consumers_path)
  end
  
  def create
    consumer = consumer_params
    producer_id = consumer[:producer_id]
    producer = Producer.find(producer_id)
    return unauthorized unless owns(producer)
    consumer = Consumer.create(consumer)
    respond_with(consumer, status: :created, location: consumer)
  end

  def destroy
    stuff = {consumer: :destroyed}
    consumer = Consumer.find(params[:id])
    consumer.destroy
    render json: stuff, status: :ok
  end

  protected

  def owns(producer)
    producer.users.include?(current_user)
  end

  private

  def consumer_params
    params.require(:consumer).permit(:name,
                                     :producer_id)
  end
end
