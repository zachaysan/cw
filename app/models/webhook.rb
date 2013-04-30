class Webhook < ActiveRecord::Base
  belongs_to :consumer
  delegate :producer, :to => :consumer, :allow_nil => false
  validates_presence_of :data
  has_many :attempts
end
