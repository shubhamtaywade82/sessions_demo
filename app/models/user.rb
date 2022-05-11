class User < ApplicationRecord
  has_secure_password

  validates :username,
    presence: true,
    length: { minimum: 6 },
    uniqueness: true
  validates :email,
    presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: true
end
