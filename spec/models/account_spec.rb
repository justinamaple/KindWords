require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with valid attributes'
  it 'is not valid without a email'
  it 'is not valid without a password'
  it 'is not valid without a icon'
end