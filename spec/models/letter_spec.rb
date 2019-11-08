require 'rails_helper'

RSpec.describe Letter, type: :model do
  subject do
    account = Account.new(email: 'test@test.com', password: 'Anything')
    described_class.new(account: account, content: 'Anything')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'has a default burned value of false' do
    expect(subject.burned == false)
  end

  it 'is not valid without an account' do
    subject.account = nil
    expect(subject).to_not be_valid
  end
end
