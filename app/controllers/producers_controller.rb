class ProducersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    email = params[:email] || current_user.email
    
    # Eventually we may want some users to have full
    # permissions on other users. For now we just 
    # check to see if a user is the allowed user
    return unauthorized unless allowed_user(email)
    producers = current_user.producers

    render json: {:producers => producers.map(&:as_json)}, status: :ok, location: producers_path
  end

  def show
    producer = Producer.find(params[:id])
    return unauthorized unless owns(producer)
    p = producer.as_json
    consumers = producer.consumers
    p[:webhook_count] = producer.webhooks.count
    p[:consumer_count] = producer.consumers.count
    p[:consumer_ids] = consumers.map(&:id)
    respond_with( { producer: p, consumers: consumers },
                  status: :ok,
                  location: producer )
  end
  
  def create
    producer = producer_params
    producer[:owner_id] = current_user.id
    producer = Producer.create(producer)
    respond_with(producer, status: :created, location: producer)
  end

  def destroy
    response = {producer: :destroyed}
    producer = Producer.find(params[:id])
    producer.destroy
    render json: response, status: :ok
  end

  private

  def producer_params
    params.require(:producer).permit(:name)
  end
end
