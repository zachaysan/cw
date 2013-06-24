class Producer < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :webhooks, :through => :consumers
  has_many :consumers
  validates_presence_of :owner_id
  validates_presence_of :name

  def find_by_user
    raise "NOT IMPLEMENTED"
  end
end
