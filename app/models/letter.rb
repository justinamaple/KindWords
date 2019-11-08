class Letter < ApplicationRecord
  belongs_to :account

  validates :content, presence: true
end
