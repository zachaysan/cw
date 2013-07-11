class PostError < ActiveRecord::Base
  has_many :attempts
  validates_presence_of :message
  attr_accessible :message
end
