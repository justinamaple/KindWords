class Response < ApplicationRecord
  belongs_to :letter
  has_one :account, through: :letter

  validates :letter, presence: true
  validates :account, presence: true
  validates :content, presence: true
end
