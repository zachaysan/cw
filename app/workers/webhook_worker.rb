require 'clockwork'
require 'httparty'

class WebhookWorker
  include Sidekiq::Worker
  include HTTParty

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)
    attempt = Attempt.new
    attempt.webhook = webhook
    begin
      resp = self.class.post(webhook.post_uri,
                             body: webhook.post_data)
      webhook.save!
      attempt.success = true
    rescue Exception => e
      puts e.message
      attempt.success = false
      err = (PostError.where(message: e.message)).any? || nil
      err ||= PostError.new
      err.message = e.message
      attempt.error = err
      attempt.save
    end
    webhook.attempt = false if not webhook.attempt
    webhook.save
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
