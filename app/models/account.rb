class Account < ApplicationRecord
  has_many :letters
  has_many :responses, through: :letters

  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
