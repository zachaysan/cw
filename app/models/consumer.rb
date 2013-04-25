class Consumer < ActiveRecord::Base
  belongs_to :producer
  has_many :webhooks
end
