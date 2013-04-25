class Webhook < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :producer, :through => :consumer
  validates_presence_of :data
end
