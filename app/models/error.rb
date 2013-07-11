class Error < ActiveRecord::Base
  has_many :attempts
  validates_presence_of :message
end
