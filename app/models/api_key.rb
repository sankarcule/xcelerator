class ApiKey < ApplicationRecord
  has_secure_token
  belongs_to :user
  before_create :set_expiration
  validates_presence_of :token, uniqueness: true

  def invalidate_token
    self.destroy!
  end

  def expired?
    DateTime.now >= self.expires_at
  end

  private

    def set_expiration
      self.expires_at = DateTime.now+30
    end

end
