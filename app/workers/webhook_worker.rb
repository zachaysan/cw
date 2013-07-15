require 'clockwork'
require 'httparty'
require 'json'

# TODO: Audit for arbitrary code execution. Deserializing the HTTP 
#       POST body and headers to use HTTParty might be a mistep.

class WebhookWorker
  include Sidekiq::Worker
  include HTTParty

  def perform(webhook_id)
    webhook = Webhook.find(webhook_id)
    attempt = Attempt.new
    attempt.webhook = webhook
    post_error = nil
    begin
      headers = webhook.post_headers
      headers &&= JSON.parse(webhook.post_headers)

      body = webhook.post_data
      body &&= JSON.parse(webhook.post_data)

      resp = self.class.post(webhook.post_uri,
                             body: body,
                             headers: headers)
      attempt.success = true

      # Stop attempting since it went through OK
      webhook.attempt = false
    rescue Exception => e
      puts e.message
      attempt.success = false
      post_error = PostError.where(message: e.message).first
      post_error ||= PostError.new
      post_error.message = e.message
      attempt.post_error = post_error
    end
    attempt.transaction do
      # TODO: Add code to handle the case where this fails.
      #       Its actually pretty hard to thing of how to 
      #       properly handle this.

      if webhook
        webhook.save! 
      else
        Rails.logger("PANIC:#{__LINE__}: There was a problem finding the webhook, got nil instead in #{__FILE__}")
      end
      
      post_error.save! if post_error
      
      if attempt
        attempt.save!
      else
        Rails.logger("PANIC:#{__LINE__}: There was a problem finding the attempt, got nil instead in #{__FILE__}")
      end
    end
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
