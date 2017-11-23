class User < ApplicationRecord
  has_secure_password
  has_many :api_keys
  validates_presence_of :email, :password
  validates :email, uniqueness: true, format: /@/

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
end
