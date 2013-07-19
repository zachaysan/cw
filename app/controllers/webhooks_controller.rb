require 'clockwork'
require 'httparty'
require 'json'

class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate!

  respond_to :json

  def index
    webhook_ids = params[:ids]
    webhooks = Webhook.find(webhook_ids)
    json_webhooks = []
    webhooks.each do |webhook|
      return unauthorized unless owns(webhook)
      attempt_ids = webhook.attempts.map(&:id)
      attempt_count = attempt_ids.length
      webhook = webhook.as_json
      webhook[:attempt_count] = attempt_count
      webhook[:attempt_ids] = attempt_ids
      json_webhooks << webhook
    end
    respond_with(json_webhooks, status: :ok, location: webhooks_path)
  end

  def show
    webhook = Webhook.find(params[:id])
    respond_with({webhook: webhook}, status: :ok, location: webhook)
  end
  
  def create
    webhook = Webhook.create(webhook_params)

    puts WebhookWorker.perform_async webhook.id

    respond_with(webhook, status: :created, location: webhook)
  end

  private

  def webhook_params
    params.require(:webhook).permit(:consumer_id,
                                    :post_uri,
                                    :post_data,
                                    :post_headers)
  end

end
