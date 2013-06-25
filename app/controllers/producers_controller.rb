class ProducersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    email = params[:email]
    return unauthorized unless correct_user(email)
    producers = current_user.producers
    respond_with(producers, status: :ok, location: producers_path)
  end

  
  def create
    producer = producer_params
    producer[:owner_id] = current_user.id
    producer = Producer.create(producer)
    respond_with(producer, status: :created, location: producer)
  end

  def destroy
    stuff = {producer: :destroyed}
    producer = Producer.find(params[:id])
    producer.destroy
    render json: stuff, status: :ok
  end

  private

  def producer_params
    params.require(:producer).permit(:name)
  end
end
