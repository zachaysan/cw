class WebhooksController < ApplicationController
  respond_to :json

  def index
    WebhookWorker.perform_async('Zach', 5)
    respond_with({index: true})
  end
  
  def create
    @webhook = Webhook.new(webhook_params)
  end

  private

  def webhook_params
    params.require(:webhook).premit(:consumer_id,
                                    :post_uri,
                                    :data)
  end

end
