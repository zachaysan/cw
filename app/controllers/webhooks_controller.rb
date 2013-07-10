class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    WebhookWorker.perform_async('Zach', 5)
    respond_with({index: true})
  end

  def show
    webhook = Webhook.find(params[:id])
    respond_with(webhook, status: :ok, location: webhook)
  end
  
  def create
    webhook = Webhook.create(webhook_params)
    WebhookWorker.perform_async webhook.id
    respond_with(webhook, status: :created, location: webhook)
  end

  private

  def webhook_params
    params.require(:webhook).permit(:consumer_id,
                                    :post_uri,
                                    :post_data)
  end

end
