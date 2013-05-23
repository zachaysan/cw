class AccessToken < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :token

  before_save :generate_token

  def generate_token
    self.token = SecureRandom.hex
  end
end
