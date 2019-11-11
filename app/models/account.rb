class Account < ApplicationRecord
  serialize :letters_seen, JSON
  has_many :letters
  has_many :responses, through: :letters
  has_many :seens

  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
