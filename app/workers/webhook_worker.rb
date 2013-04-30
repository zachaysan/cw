require 'clockwork'

class WebhookWorker
  include Sidekiq::Worker

  def perform(webhook)
    puts "I will get #{@webhook} done in a jiffy!"
  end
end

module Clockwork
  every 1.minute do
    @webhooks.failed do |webhook|
      WebhookWorker.perform_async webhook
    end
  end
end
