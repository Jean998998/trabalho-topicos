class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Must contain a minimum of eight characters, at least one uppercase letter, one lowercase letter, one number and one special character" }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }

  has_many :coins
  has_many :mining_types

end
