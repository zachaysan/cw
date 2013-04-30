class WebhookController < ApplicationController
  respond_to :json

  def index
    WebhookWorker.perform_async('Zach', 5)
    respond_with({index: true})
  end
  
  def create
    @webhook = Webhook.new(params[:webhook])
  end

end
