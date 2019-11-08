class Letter < ApplicationRecord
  belongs_to :account
  has_many :responses

  validates :content, presence: true
  validates :account, presence: true
end
