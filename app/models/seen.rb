class Seen < ApplicationRecord
  belongs_to :account
  belongs_to :letter

  validates :letter, presence: true
  validates :account, presence: true
end
