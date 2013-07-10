require 'clockwork'
require 'httparty'

class WebhookWorker
  include Sidekiq::Worker
  include HTTParty

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)
    resp = self.class.post(webhook.post_uri,
                           body: webhook.post_data)

    webhook.attempt = false
    webhook.save!
  end
end

module Clockwork
=begin
  every 1.minute do
    @webhooks.failed do |webhook|
      WebhookWorker.perform_async webhook unless webhook.attempts.length > webhook.max_attempts
    end
  end
=end
end
