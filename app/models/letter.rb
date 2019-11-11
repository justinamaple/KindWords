class Letter < ApplicationRecord
  belongs_to :account
  has_many :responses
  has_many :seens

  validates :content, presence: true
  validates :account, presence: true
end
