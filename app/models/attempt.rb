class Attempt < ActiveRecord::Base
  belongs_to :webhook
  belongs_to :error
  validates_presence_of :success

  def register_error(error)
    error = Error.where(message: error.message).any? || nil
    error ||= Error.new(message: error.message)
    error.save!
  end
end
