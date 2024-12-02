class User < ApplicationRecord
  has_secure_password

  # Validate email presence, format, and uniqueness
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Validate password presence and confirmation
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # Validate role presence and inclusion in allowed values
  validates :role, presence: true, inclusion: { in: %w[teacher ta student] }
end
