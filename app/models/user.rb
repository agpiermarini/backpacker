class User < ApplicationRecord
  validates :email,    presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_secure_password

  enum role: [ :default, :admin ]

  has_many :destinations
end
