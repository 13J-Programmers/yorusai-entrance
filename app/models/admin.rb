class Admin < ApplicationRecord
  before_save do
    self.email.downcase!
  end

  # name
  validates :name, presence: true, length: { maximum: 50 }

  # email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  # password, password_confirmation
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # --- class methods ---

  class << self
    # return a hashed value of given string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
                                                  : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # return a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # --- public ---

  def authenticated?(password)
    return false if self.password_digest.nil?
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # --- private ---
  private
    # converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end
end
