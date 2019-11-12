require 'rails_helper'

RSpec.describe Seen, type: :model do
  subject do
    account = Account.create(email: '1@1.com', password: 'Anything')
    letter = Letter.create(account: account, content: 'Anything')

    described_class.new(account: account, letter: letter)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an account' do
    subject.account = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an letter' do
    subject.letter = nil
    expect(subject).to_not be_valid
  end
end
