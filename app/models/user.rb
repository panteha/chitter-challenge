require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, :unique => true
  property :password_digest, Text

  validates_format_of :email, as: :email_address
  validates_presence_of :password_confirmation
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :min => 8

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    result = User.first(:email => email)
    if result
      password_obj = BCrypt::Password.new(result.password_digest)
      return result if password_obj == password
    end
  end

end
