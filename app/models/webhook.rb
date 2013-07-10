class Webhook < ActiveRecord::Base
  has_many :attempts
  belongs_to :consumer
  delegate :producer, :to => :consumer, allow_nil: false

  after_initialize :assign_defaults, if: 'new_record?'

  scope :failed, where(failed: true)
  scope :attempt, where(attempt: true)

  validates_presence_of :post_data
  validates_presence_of :post_uri
  validate :attempt_only_if_not_failed

  MAX_ATTEMPTS = 10
  
  def max_attempts
    MAX_ATTEMPTS
  end

  private

  def attempt_only_if_not_failed
    errors.add(:attempt, "webhook.cannot_attempt_while_failed") if failed and attempt
  end

  def assign_defaults
    self.attempt = true if self.attempt.nil?
    self.failed = false if self.failed.nil?
  end

end
