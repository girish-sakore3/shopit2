require 'bcrypt'
class Otp < ApplicationRecord
  
  belongs_to :user
  before_create :code

  def generate
    encoded = BCrypt::Password.create(self.code)
  end

  def verify(encoded_string)
    decoded = BCrypt::Password.new(encoded_string)
    if decoded == self.code
      true
    else
      false
    end
  end

  private

  def code
    self.code = 6.times.map{rand(9)}.join
  end

end
