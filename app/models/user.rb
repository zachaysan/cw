class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessor :password

  has_and_belongs_to_many :producers
  has_one :access_token

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
