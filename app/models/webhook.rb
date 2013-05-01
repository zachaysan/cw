class Webhook < ActiveRecord::Base
  has_many :attempts
  belongs_to :consumer
  delegate :producer, :to => :consumer, allow_nil: false

  scope :failed, where(failed: true)
  scope :attempt, where(attempt: true)

  validates_presence_of :data
  validate :attempt_only_if_not_failed

  private
  def attempt_only_if_not_failed
    errors.add(:attempt, "webhook.cannot_attempt_while_failed") if failed and attempt
  end
end
