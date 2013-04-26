class Consumer < ActiveRecord::Base
  # The consumer model is used for reporting for the 
  # captain webhooks client. It has been decided that 
  # until fraud becomes a problem, there is no need 
  # to verify the domain to a consumer.
  
  belongs_to :producer
  has_many :webhooks
  validates_presence_of :name
end
