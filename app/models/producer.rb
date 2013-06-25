class Producer < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :webhooks, :through => :consumers
  has_many :consumers
  validates_presence_of :owner_id
  validates_presence_of :name

  before_create :make_admin_user

  def make_admin_user
    user = User.find( self.owner_id )
    self.users << user
  end

end
