class Producer < ActiveRecord::Base
  has_many :webhooks, :through => :consumers
  has_many :consumers
end
