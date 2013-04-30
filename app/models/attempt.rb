class Attempt < ActiveRecord::Base
  belongs_to :webhook
  validates_presence_of :success
end
