class User < ApplicationRecord
  validates :email,    presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_secure_password
  # validates :password_digest, confirmation: { case_sensitive: true }

  enum role: ["default", "admin"]
end
