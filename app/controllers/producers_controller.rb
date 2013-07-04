class ProducersController < ApplicationController
  skip_before_filter :verify_authenticity_token, except: :show
  before_filter :authenticate!, except: :show

  respond_to :json

  def index
    email = params[:email] || current_user.email
    
    # Eventually we may want some users to have full
    # permissions on other users. For now we just 
    # check to see if a user is the allowed user
    return unauthorized unless allowed_user(email)
    producers = current_user.producers
    producers_list = []

    producers.each do |producer|
      producers_list.append(producer.to_json)
    end

    render json: {:producers => producers_list}, status: :ok, location: producers_path
  end

  def show
    producer = Producer.find(params[:id])
    respond_with(producer, status: :ok, location: producer)
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
