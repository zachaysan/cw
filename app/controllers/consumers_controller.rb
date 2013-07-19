class ConsumersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    # TODO: Refactor hacky code
    if params[:producer_id]
      producer_id = params[:producer_id]
      producer = Producer.find(producer_id)
      return unauthorized unless owns(producer)
      consumers = producer.consumers
      respond_with(consumers, status: :ok, location: consumers_path)
    elsif params[:ids]
      consumer_ids = params[:ids]
      consumers = Consumer.find(consumer_ids)
      consumers.each do |consumer|
        return unauthorized unless owns(consumer)
      end
      respond_with(consumers.as_json, status: :ok, location: consumers_path)
    end
  end

  def show
    consumer_id = params[:id]
    consumer = Consumer.find(consumer_id)

    return unauthroized unless owns(consumer)

    c = consumer.as_json
    
    webhooks = consumer.webhooks
    c[:failed_webhook_ids] = consumer.webhooks.map(&:id)
    w = webhooks.as_json

    c[:webhook_count] = webhooks.count
    c[:webhook_ids] = webhooks.map(&:id)
    respond_with( { consumer: c, webhooks: webhooks },
                  status: :ok,
                  location: consumer )
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

  private

  def consumer_params
    params.require(:consumer).permit(:name,
                                     :producer_id)
  end
end
